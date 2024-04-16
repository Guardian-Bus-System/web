import 'package:capstone_front/screen/auth/widgets/formatter.dart';
import 'package:capstone_front/screen/auth/widgets/input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hitText;
  final bool blindetext;

  const InputTextFieldWidget({Key? key, required this.textEditingController, required this.hitText, required this.blindetext}) : super(key: key);

  @override
  _InputTextFieldWidgetState createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  bool _isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();
    _updateTextFieldEmptyStatus(); // 텍스트 필드가 비어 있는지 여부를 업데이트합니다.
  }

  void _updateTextFieldEmptyStatus() {
    setState(() {
      _isTextFieldEmpty = widget.textEditingController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return JoinContainer(
      widget: TextField(
        controller: widget.textEditingController,
        cursorColor: Colors.blue,
        obscureText: widget.blindetext ? true : false,
        inputFormatters: widget.hitText == '전화번호' ?
          <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
            PhoneInputFormatter(),
          ]
            : null,
        onChanged: (value) {
          _updateTextFieldEmptyStatus(); // 텍스트 필드가 변경될 때마다 상태를 업데이트
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder( // 포커스가 들어왔을 때 볼더의 스타일을 지정
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue)),
          filled: true,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126),fontSize: 15),
          hintText: widget.hitText,
          fillColor: Colors.white,
          suffixIcon: widget.hitText == '전화번호' ? // 상태에 따라 아이콘 생성
            IconButton(
              icon: Icon(Icons.send, color: _isTextFieldEmpty ? Colors.grey : Colors.blue), // 텍스트 필드가 비어있지 않으면 파란색 아이콘을 보여줍니다.
              onPressed: () => {}
            )
              : null,
        ),
      ),
    );
  }
}
