// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';
import '../payment_type_controller.dart';

class PaymentTypeHeader extends StatefulWidget {
  const PaymentTypeHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PaymentTypeController controller;

  @override
  State<PaymentTypeHeader> createState() => _PaymentTypeHeaderState();
}

class _PaymentTypeHeaderState extends State<PaymentTypeHeader> {
  bool? enabled;

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      buttonLabel: 'Adicionar',
      title: 'Administrar formas de pagamento'.toUpperCase(),
      buttonOnPressed: () {
        widget.controller.addPayment();
      },
      isButtonNeeded: true,
      searchChanged: (value) {},
      filterWidget: DropdownButton<bool>(
        onChanged: (value) {
          setState(() {
            enabled = value;
            widget.controller.changeFilter(value);
          });
        },
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
