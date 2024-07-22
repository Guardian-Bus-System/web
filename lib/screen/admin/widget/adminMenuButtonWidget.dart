import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.height = 48,
    this.width,
    this.onTap,
    this.child,
    this.color,
  });

  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: color ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.transparent),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final int index;
  final String buttonName;
  final IconData icon;
  final String route;
  final bool isSingleAction;
  final double screenWidth;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.index,
    required this.buttonName,
    required this.icon,
    required this.route,
    required this.isSingleAction,
    required this.screenWidth,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      width: screenWidth - 0.03125,
      onTap: onTap,
      color: isSelected ? Colors.white : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: isSelected ? Colors.black : Colors.white).pSymmetric(h: 15),
          buttonName.text.color(isSelected ? Colors.black : Colors.white).size(20).make(),
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final List<Map<String, String>> menuItems;
  final double screenWidth;
  final ValueChanged<Map<String, String>> onMenuItemTap;
  final String? selectedSubMenu;

  const MenuWidget({
    required this.menuItems,
    required this.screenWidth,
    required this.onMenuItemTap,
    required this.selectedSubMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: menuItems.map((item) => MenuItem(
        item: item,
        screenWidth: screenWidth,
        onMenuItemTap: onMenuItemTap,
        isSelected: selectedSubMenu == item['text'],
      )).toList(),
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
          color: Colors.white,
          fontSize: 18,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ).pOnly(bottom: 15, left: screenWidth * 0.03125),
    );
  }
}