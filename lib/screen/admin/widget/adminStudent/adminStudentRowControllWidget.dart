import 'package:capstone_front/controller/adminController/adminStudent_controller.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminStudentTextField.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/screen/admin/widget/AdminLine.dart';

class StudentRowControllWidget extends StatefulWidget {
  final int id;
  final String uuid;
  final String username;
  final String password;
  final int grade;
  final int classNumber;
  final int number;
  final String name;
  final String phone;
  final bool isChecked;
  final ValueChanged<bool?> onCheckboxChanged;

  const StudentRowControllWidget({
    Key? key,
    required this.id,
    required this.uuid,
    required this.username,
    required this.password,
    required this.grade,
    required this.classNumber,
    required this.number,
    required this.name,
    required this.phone,
    required this.isChecked,
    required this.onCheckboxChanged,
  }) : super(key: key);

  @override
  _StudentRowControllWidgetState createState() => _StudentRowControllWidgetState();
}

class _StudentRowControllWidgetState extends State<StudentRowControllWidget> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _gradeController;
  late TextEditingController _classNumberController;
  late TextEditingController _numberController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  // Focus nodes for each text field
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _gradeFocusNode = FocusNode();
  final FocusNode _classNumberFocusNode = FocusNode();
  final FocusNode _numberFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.username);
    _passwordController = TextEditingController(text: widget.password);
    _gradeController = TextEditingController(text: '${widget.grade}');
    _classNumberController = TextEditingController(text: '${widget.classNumber}');
    _numberController = TextEditingController(text: '${widget.number}');
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);

    // Add focus listeners to detect when any text field is focused
    _usernameFocusNode.addListener(() => _updateEditingState(true));
    _passwordFocusNode.addListener(() => _updateEditingState(true));
    _gradeFocusNode.addListener(() => _updateEditingState(true));
    _classNumberFocusNode.addListener(() => _updateEditingState(true));
    _numberFocusNode.addListener(() => _updateEditingState(true));
    _nameFocusNode.addListener(() => _updateEditingState(true));
    _phoneFocusNode.addListener(() => _updateEditingState(true));
  }

  void _updateEditingState(bool isEditing) {
    setState(() {
      _isEditing = isEditing;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _gradeController.dispose();
    _classNumberController.dispose();
    _numberController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _gradeFocusNode.dispose();
    _classNumberFocusNode.dispose();
    _numberFocusNode.dispose();
    _nameFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(StudentRowControllWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.username != oldWidget.username) {
      _usernameController.text = widget.username;
    }
    if (widget.password != oldWidget.password) {
      _passwordController.text = widget.password;
    }
    if (widget.grade != oldWidget.grade) {
      _gradeController.text = '${widget.grade}';
    }
    if (widget.classNumber != oldWidget.classNumber) {
      _classNumberController.text = '${widget.classNumber}';
    }
    if (widget.number != oldWidget.number) {
      _numberController.text = '${widget.number}';
    }
    if (widget.name != oldWidget.name) {
      _nameController.text = widget.name;
    }
    if (widget.phone != oldWidget.phone) {
      _phoneController.text = widget.phone;
    }
  }

  Future<void> _saveData() async {
    print('_saveData called'); // Log to indicate the function is called
    await saveData(
      widget.uuid,
      _usernameController.text,
      _passwordController.text,
      _nameController.text,
      _phoneController.text,
      '${_gradeController.text}학년 ${_classNumberController.text}반',
      int.parse(_numberController.text),
      widget.isChecked,
      () {
        setState(() {
          _isEditing = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Building widget, _isEditing: $_isEditing'); // Log to indicate build status
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Checkbox(
                    checkColor: Colors.black,
                    fillColor: MaterialStateProperty.all(Colors.white),
                    value: widget.isChecked,
                    onChanged: widget.onCheckboxChanged,
                  ),
                ),
                '${widget.id}'.text.xl.make().pOnly(left: 40),
                buildTextField(_usernameController, widget.username, 45, _usernameFocusNode, _setEditingState),
                buildTextField(_passwordController, widget.password, 55, _passwordFocusNode, _setEditingState),
                buildTextField(_gradeController, '${widget.grade}', 115, _gradeFocusNode, _setEditingState),
                buildTextField(_classNumberController, '${widget.classNumber}', 28, _classNumberFocusNode, _setEditingState),
                buildTextField(_numberController, '00', 35, _numberFocusNode, _setEditingState),
                buildTextField(_nameController, widget.name, 40, _nameFocusNode, _setEditingState),
                buildTextField(_phoneController, widget.phone, 75, _phoneFocusNode, _setEditingState),
              ],
            ),
            TextButton(
              onPressed: _isEditing
                  ? () async {
                      print('Save button pressed'); // Log to indicate button press
                      await _saveData();
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
