import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String getFormattedDateTime() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy년 MM월 dd일');
  String dayOfTheWeek = DateFormat('E', 'ko_KR').format(now);
  return '${formatter.format(now)} $dayOfTheWeek요일';
}

String getFormattedDateDashTime() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  return '${formatter.format(now)}';
}

class PhoneInputFormatter extends TextInputFormatter {
  static const kPhoneNumberPrefix = '010-';

  // 텍스트 편집 업데이트를 처리하기 위해 formatEditUpdate 메서드를 재정의
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = _getFormattedPhoneNumber(newValue.text);
    
    // 업데이트된 선택과 함께 포맷된 텍스트를 반환
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  // 전화번호의 길이에 따라 형식을 지정하는 메서드
  String _getFormattedPhoneNumber(String value) {
    value = _cleanPhoneNumber(value);

    if (value.length == 1) {
    //값이 없을 때 010-최초값 포멧
      value = kPhoneNumberPrefix + value.substring(0, value.length);
    } else if (value.length < 4) {
    // 010- 을 지우지 못하도록 010- 유지
      value = kPhoneNumberPrefix;
    } else if (value.length >= 8 && value.length < 12) {
    // 010-xxxx-xxxx 포멧
      value = '$kPhoneNumberPrefix${value.substring(3, 7)}-${value.substring(7, value.length)}';
    } else {
    // 010-xxxx 포멧 (자릿수 제한은 inputformatters 로 구현)
      value = kPhoneNumberPrefix + value.substring(3, value.length);
    }

    return value;
  }

  // 입력에서 숫자가 아닌 문자를 제거하는 메서드
  String _cleanPhoneNumber(String value) {
    return value.replaceAll(RegExp(r'[-\s]'), '');
  }
}

class Validate {
  static String? validatePassword(String value) {
    String pattern = r'^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{10,15}$';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return '비밀번호를 입력하세요';
    } else if (value.length < 10) {
      return '비밀번호는 10자리 이상이어야 합니다';
    } else if (!regExp.hasMatch(value)) {
      return '특수문자, 문자, 숫자 포함 10자 이상 15자 이내로 입력하세요.';
    } else {
      return null; //null을 반환하면 정상
    }
  }
  
  static String? validatePasswordConfirm(String password, String passwordConfirm) {
    if (passwordConfirm.isEmpty) {
      return '비밀번호 확인칸을 입력하세요';
    } else if (password != passwordConfirm) {
      return '입력한 비밀번호가 서로 다릅니다.';
    } else {
      return null; //null을 반환하면 정상
    }
  }
}