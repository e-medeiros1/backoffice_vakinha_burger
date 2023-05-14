import 'package:flutter/material.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../models/payment_type_model.dart';
import '../payment_type_controller.dart';

class PaymentTypeItem extends StatelessWidget {
  const PaymentTypeItem({
    super.key,
    required this.payment,
    required this.controller,
  });

  final PaymentTypeModel payment;
  final PaymentTypeController controller;

  @override
  Widget build(BuildContext context) {
    final colorAll = payment.enabled ? Colors.black : Colors.grey;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              'assets/images/payment_${payment.acronym}_icon.png',
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/payment_notfound_icon.png',
                  color: colorAll,
                );
              },
              color: colorAll,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      'Forma de pagamento',
                      style: context.textStyles.textRegular
                          .copyWith(color: colorAll),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    child: Text(
                      payment.name,
                      style: context.textStyles.textButtonTitle
                          .copyWith(color: colorAll),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    controller.editPayment(payment);
                  },
                  child: Text(
                    'Editar',
                    style: context.textStyles.textMedium.copyWith(
                      color: !payment.enabled
                          ? Colors.grey
                          : context.colors.primary,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
