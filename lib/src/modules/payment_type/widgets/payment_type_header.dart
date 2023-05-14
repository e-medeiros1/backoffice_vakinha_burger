import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';
import '../payment_type_controller.dart';

class PaymentTypeHeader extends StatelessWidget {
  const PaymentTypeHeader({super.key, required this.controller});

  final PaymentTypeController controller;

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      buttonLabel: 'Adicionar',
      title: 'Administrar formas de pagamento'.toUpperCase(),
      buttonOnPressed: () {
        controller.addPayment();
      },
      isButtonNeeded: true,
      searchChanged: (value) {},
      filterWidget: DropdownButton<bool>(
        onChanged: (value) {},
        value: null,
        items: const [
          DropdownMenuItem(
            value: null,
            child: Text('Todos'),
          ),
          DropdownMenuItem(
            value: true,
            child: Text('Ativos'),
          ),
          DropdownMenuItem(
            value: false,
            child: Text('Inativos'),
          )
        ],
      ),
    );
  }
}
