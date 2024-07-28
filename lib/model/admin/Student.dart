class Student {
  final String id;
  final String loginId; // 로그인 ID
  final String name;
  final String phoneNumber;
  final String gradeClass; // 학년과 반을 포함한 문자열
  final int grade; // 학년
  final int classNumber; // 반
  final int number;

  Student({
    required this.id,
    required this.loginId,
    required this.name,
    required this.phoneNumber,
    required this.gradeClass,
    this.grade = 0, // 기본값 설정
    this.classNumber = 0, // 기본값 설정
    required this.number,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    String parseString(dynamic value) {
      if (value == null) return ''; // null인 경우 빈 문자열
      return value.toString(); // 기본 문자열 변환
    }

    int parseInt(dynamic value) {
      if (value == null) return 0; // null인 경우 기본값
      if (value is int) return value;
      if (value is String && value.isNotEmpty) {
        try {
          return int.parse(value);
        } catch (e) {
          print('Error parsing int: $e'); // 디버깅용 출력
          return 0; // 예외가 발생한 경우 기본값
        }
      }
      return 0; // 예외적인 경우 기본값
    }

    String gradeClass = parseString(json['gradeClass']);
    int grade = 0;
    int classNumber = 0;

    RegExp exp = RegExp(r'(\d+)학년 (\d+)반');
    Match? match = exp.firstMatch(gradeClass);

    if (match != null) {
      grade = int.parse(match.group(1) ?? '0');
      classNumber = int.parse(match.group(2) ?? '0');
    }

    return Student(
      id: parseString(json['id']),
      loginId: parseString(json['loginId']),
      name: parseString(json['name']),
      phoneNumber: parseString(json['phoneNumber']),
      gradeClass: gradeClass,
      grade: grade,
      classNumber: classNumber,
      number: parseInt(json['number']),
    );
  }
}


// model/admin/Student.dart
class StudentUser {
  final String id;
  final String loginId;
  final String name;
  final String phoneNumber;
  final String gradeClass;
  final int grade; // 학년
  final int classNumber; // 반
  final int number;
  final bool usingCk;

  StudentUser({
    required this.id,
    required this.loginId,
    required this.name,
    required this.phoneNumber,
    required this.gradeClass,
    this.grade = 0, 
    this.classNumber = 0,
    required this.number,
    required this.usingCk,
  });

  factory StudentUser.fromJson(Map<String, dynamic> json) {
    String parseString(dynamic value) {
      if (value == null) return ''; // null인 경우 빈 문자열
      return value.toString(); // 기본 문자열 변환
    }

    int parseInt(dynamic value) {
      if (value == null) return 0; // null인 경우 기본값
      if (value is int) return value;
      if (value is String && value.isNotEmpty) {
        try {
          return int.parse(value);
        } catch (e) {
          print('Error parsing int: $e'); // 디버깅용 출력
          return 0; // 예외가 발생한 경우 기본값
        }
      }
      return 0; // 예외적인 경우 기본값
    }

    String gradeClass = parseString(json['gradeClass']);
    int grade = 0;
    int classNumber = 0;

    RegExp exp = RegExp(r'(\d+)학년 (\d+)반');
    Match? match = exp.firstMatch(gradeClass);

    if (match != null) {
      grade = int.parse(match.group(1) ?? '0');
      classNumber = int.parse(match.group(2) ?? '0');
    }

    return StudentUser(
      id: parseString(json['id']),
      loginId: parseString(json['loginId']),
      name: parseString(json['name']),
      phoneNumber: parseString(json['phoneNumber']),
      gradeClass: gradeClass,
      grade: grade,
      classNumber: classNumber,
      number: parseInt(json['number']), 
      usingCk: json['usingCk'],
    );
  }
}
