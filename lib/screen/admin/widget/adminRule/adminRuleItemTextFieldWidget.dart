import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminStudentTextField.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/screen/admin/widget/AdminLine.dart';

class AdminRuleRowControllRuleWidget extends StatefulWidget {
  final int id;
  final String content;

  const AdminRuleRowControllRuleWidget({
    Key? key,
    required this.id,
    required this.content,
  }) : super(key: key);

  @override
  _AdminRuleRowControllRuleWidgetState createState() => _AdminRuleRowControllRuleWidgetState();
}

class _AdminRuleRowControllRuleWidgetState extends State<AdminRuleRowControllRuleWidget> {
  late TextEditingController _contentController;

  // Focus nodes for each text field
  final FocusNode _contentFocusNode = FocusNode();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController(text: widget.content);
    
    _contentFocusNode.addListener(() => _updateEditingState(true));
  }

  void _updateEditingState(bool isEditing) {
    setState(() {
      _isEditing = isEditing;
    });
  }

  @override
  void dispose() {
    _contentController.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AdminRuleRowControllRuleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.content != oldWidget.content) {
      _contentController.text = widget.content;
    }
  }

  // Future<void> _saveData() async {
  //   print('_saveData called'); // Log to indicate the function is called
  //   await saveData(
  //     widget.uuid,
  //     _usernameController.text,
  //     _passwordController.text,
  //     _nameController.text,
  //     _phoneController.text,
  //     '${_gradeController.text}학년 ${_classNumberController.text}반',
  //     int.parse(_numberController.text),
  //     widget.isChecked,
  //     () {
  //       setState(() {
  //         _isEditing = false;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                '${widget.id}'.text.xl.make().pOnly(left: 40),
                SizedBox(
                  width: screen.width * 0.6,
                  child: buildTextRuleField(_contentController, context, 45, _contentFocusNode, _setEditingState)
                ),
              ],
            ),
            TextButton(
              onPressed: _isEditing
                  ? () async {
                      print('Save button pressed'); // Log to indicate button press
                      //await _saveData();
                      print('Save operation complete'); // Log to indicate completion
                    }
                  : null, // 비활성화된 상태에서 버튼을 클릭할 수 없도록 설정
              child: Container(
                width: 75,
                height: 30,
                decoration: BoxDecoration(
                  color: _isEditing
                      ? Color.fromARGB(255, 236, 82, 82)
                      : Colors.white, // 비활성화된 상태일 때 버튼 색상 변경
                  borderRadius: BorderRadius.circular(5),
                ),
                child: '저장'.text.white.center.xl.make().pOnly(top: 3),
              ),
            ),
          ],
        ),
        const AdminLine(),
      ],
    );
  }
  
  void _setEditingState(bool isEditing) {
    setState(() {
      _isEditing = isEditing;
    });
  }
}
