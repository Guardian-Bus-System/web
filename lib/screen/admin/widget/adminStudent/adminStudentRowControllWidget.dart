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
  final VoidCallback onSavePressed;

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
    required this.onSavePressed,
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
    _usernameFocusNode.addListener(() => _updateEditingState(_usernameFocusNode));
    _passwordFocusNode.addListener(() => _updateEditingState(_passwordFocusNode));
    _gradeFocusNode.addListener(() => _updateEditingState(_gradeFocusNode));
    _classNumberFocusNode.addListener(() => _updateEditingState(_classNumberFocusNode));
    _numberFocusNode.addListener(() => _updateEditingState(_numberFocusNode));
    _nameFocusNode.addListener(() => _updateEditingState(_nameFocusNode));
    _phoneFocusNode.addListener(() => _updateEditingState(_phoneFocusNode));
  }

  void _updateEditingState(FocusNode focusNode) {
    setState(() {
      _isEditing = focusNode.hasFocus;
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

  @override
  Widget build(BuildContext context) {
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
                widget.username.text.xl.make().pOnly(left: 45),
                widget.password.text.xl.make().pOnly(left: 55),
                _buildTextField(_gradeController, '0', 165, _gradeFocusNode),
                _buildTextField(_classNumberController, '0', 30, _classNumberFocusNode),
                _buildTextField(_numberController, '00', 40, _numberFocusNode),
                _buildTextField(_nameController, 'name', 40, _nameFocusNode),
                _buildTextField(_phoneController, '000-0000-0000', 75, _phoneFocusNode),
              ],
            ),
            if (_isEditing)
              TextButton(
                onPressed: widget.onSavePressed,
                child: Container(
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 82, 82),
                      borderRadius: BorderRadius.circular(5)),
                  child: '저장'.text.white.center.xl.make().pOnly(top: 3),
                ),
              ),
          ],
        ),
        const AdminLine(),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, double leftPadding, FocusNode focusNode) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: SizedBox(
        width: _getTextFieldWidth(label),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          textAlign: TextAlign.center,
          keyboardType: label.length < 5 ? TextInputType.number : TextInputType.text,
          onChanged: (value) {
            setState(() {
              _isEditing = true;
            });
          },
        ),
      ),
    );
  }

  double _getTextFieldWidth(String label) {
    if (label.length > 5) return 150;
    if (label.length < 2) return 40;
    if (label.length > 2) return 74;
    return 48;
  }
}
