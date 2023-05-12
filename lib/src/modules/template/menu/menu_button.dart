import 'package:flutter/material.dart';

import '../../../core/ui/styles/text_styles.dart';
import 'menu_enum.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.menu,
    required this.menuSelected,
    required this.onPressed,
  });

  final Menu menu;
  final Menu? menuSelected;
  final ValueChanged<Menu> onPressed;

  @override
  Widget build(BuildContext context) {
    final isSelected = menuSelected == menu;
    return LayoutBuilder(
      builder: (_, constrains) {
        return Visibility(
          visible: constrains.maxWidth != 90,
          replacement: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: isSelected
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFF5E2),
                  )
                : null,
            child: Tooltip(
              message: menu.label,
              child: IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/icons/${isSelected ? menu.assetIconSelected : menu.assetIcon}',
                  ),
                ),
              ),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onPressed(menu),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                decoration: isSelected
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFFFF5E2),
                      )
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/icons/${isSelected ? menu.assetIconSelected : menu.assetIcon}',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        menu.label,
                        overflow: TextOverflow.ellipsis,
                        style: isSelected
                            ? context.textStyles.textBold
                            : context.textStyles.textRegular,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}