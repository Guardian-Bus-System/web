// NoticeModel.dart
class Notice {
  final int id;
  final String title;
  final String createAt;
  final String? updateAt; // nullable
  final bool viewsCk;
  final User user;

  Notice({
    required this.id,
    required this.title,
    required this.createAt,
    this.updateAt,
    required this.viewsCk,
    required this.user,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json['id'],
      title: json['title'],
      createAt: json['createAt'],
      updateAt: json['updateAt'],
      viewsCk: json['viewsCk'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String id;
  final String loginId;
  final String name;
  final String phoneNumber;
  final String gradeClass;
  final int number;
  final bool usingCk;
  final bool? boardingCk; // nullable
  final List<Role> roles;
  final List<Authority> authorities;

  User({
    required this.id,
    required this.loginId,
    required this.name,
    required this.phoneNumber,
    required this.gradeClass,
    required this.number,
    required this.usingCk,
    this.boardingCk,
    required this.roles,
    required this.authorities,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      loginId: json['loginId'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      gradeClass: json['gradeClass'],
      number: json['number'],
      usingCk: json['usingCk'],
      boardingCk: json['boardingCk'],
      roles: (json['roles'] as List).map((role) => Role.fromJson(role)).toList(),
      authorities: (json['authorities'] as List).map((auth) => Authority.fromJson(auth)).toList(),
    );
  }
}

class Role {
  final String id;
  final String title;

  Role({
    required this.id,
    required this.title,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      title: json['title'],
    );
  }
}

class Authority {
  final String authority;

  Authority({
    required this.authority,
  });

  factory Authority.fromJson(Map<String, dynamic> json) {
    return Authority(
      authority: json['authority'],
    );
  }
}

// NoticesModel.dart
class NoticeResponse {
  final int status;
  final String message;
  final List<Notice> data;

  NoticeResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NoticeResponse.fromJson(Map<String, dynamic> json) {
    return NoticeResponse(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List).map((notice) => Notice.fromJson(notice)).toList(),
    );
  }
}
