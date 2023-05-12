import 'package:flutter/material.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import 'menu_button.dart';
import 'menu_enum.dart';

class CustomMenuBar extends StatefulWidget {
  const CustomMenuBar({super.key});

  @override
  State<CustomMenuBar> createState() => _CustomMenuBarState();
}

class _CustomMenuBarState extends State<CustomMenuBar> {
  Menu? selectedMenu;
  var collapsed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: collapsed ? 90 : context.percentWidth(.18),
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: collapsed ? Alignment.center : Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  collapsed = !collapsed;
                });
              },
              icon: Icon(
                collapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: Menu.values.length,
            itemBuilder: (context, index) {
              final menu = Menu.values[index];
              return MenuButton(
                menu: menu,
                menuSelected: selectedMenu,
                onPressed: (Menu menu) {
                  setState(() {
                    selectedMenu = menu;
                  });
                },
              );
            },
          )
        ],
      ),
    );
  }
}
