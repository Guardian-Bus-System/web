import 'package:flutter/material.dart';

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