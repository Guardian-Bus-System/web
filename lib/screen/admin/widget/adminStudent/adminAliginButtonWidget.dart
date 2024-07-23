import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AliginWidget extends StatelessWidget {
  final List<Map<String, String>> menuItems;
  final double screenWidth;
  final ValueChanged<Map<String, String>> onMenuItemTap;
  final String? selectedSubMenu;

  const AliginWidget({
    required this.menuItems,
    required this.screenWidth,
    required this.onMenuItemTap,
    required this.selectedSubMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: menuItems
          .map((item) => MenuItem(
                item: item,
                screenWidth: screenWidth,
                onMenuItemTap: onMenuItemTap,
                isSelected: selectedSubMenu == item['text'],
              ))
          .toList(),
    );
  }
}

class MenuItem extends StatelessWidget {
  final Map<String, String> item;
  final double screenWidth;
  final ValueChanged<Map<String, String>> onMenuItemTap;
  final bool isSelected;

  const MenuItem({
    required this.item,
    required this.screenWidth,
    required this.onMenuItemTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onMenuItemTap(item),
      child: Text(
        item['text']!,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ).pOnly(left: 15),
    );
  }
}
