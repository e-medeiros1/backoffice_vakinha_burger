import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class BaseHeader extends StatelessWidget {
  const BaseHeader({
    super.key,
    required this.title,
    required this.searchChanged,
    required this.buttonLabel,
    this.buttonOnPressed,
    this.isButtonNeeded = true,
    this.filterWidget,
  });

  final String title;
  final ValueChanged<String> searchChanged;
  final String buttonLabel;
  final VoidCallback? buttonOnPressed;
  final bool isButtonNeeded;
  final Widget? filterWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return Wrap(
          children: [
            Visibility(
              visible: filterWidget == null,
              replacement: filterWidget ?? const SizedBox.shrink(),
              child: SizedBox(
                width: constrains.maxWidth * .15,
                child: TextFormField(
                  onChanged: searchChanged,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon:
                        Icon(Icons.search, size: constrains.maxWidth * 0.02),
                    label: Text(
                      'Buscar',
                      style: context.textStyles.textRegular
                          .copyWith(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: constrains.maxWidth * .65,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.textStyles.textButtonTitle.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
            ),
            Visibility(
              visible: isButtonNeeded ,
              child: SizedBox(
                height: 48,
                width: constrains.maxWidth * .15,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: constrains.maxWidth * 0.02,
                  ),
                  label: Text(
                    buttonLabel,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
