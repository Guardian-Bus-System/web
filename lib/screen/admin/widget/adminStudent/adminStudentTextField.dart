import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:flutter/material.dart';

Widget buildTextField(
  TextEditingController controller,
  String label,
  double leftPadding,
  FocusNode focusNode,
  Function(bool) setEditingState,
) {
  return Padding(
    padding: EdgeInsets.only(left: leftPadding),
    child: SizedBox(
      width: getTextFieldWidth(label),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        textAlign: TextAlign.center,
        keyboardType: label.length < 5 ? TextInputType.number : TextInputType.text,
        onChanged: (value) {
          print('Text field changed: $value'); // Log to indicate text change
          setEditingState(true);
        },
      ),
    ),
  );
}
Widget buildTextRuleField(
  TextEditingController controller,
  BuildContext context,
  double leftPadding,
  FocusNode focusNode,
  Function(bool) setEditingState,
) {
  ScreenSize screen = ScreenSize(context);
  return Padding(
    padding: EdgeInsets.only(left: leftPadding),
    child: SizedBox(
      width: screen.width * 0.7,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setEditingState(true);
        },
      ),
    ),
  );
}

double getTextFieldWidth(String label) {
  if (label.length > 5) return 150;
  if (label.length < 2) return 40;
  if (label.length > 2) return 74;
  return 48;
}
