import 'dart:convert';

class User {
  final String id;
  final String loginId;
  final String name;
  final String phoneNumber;
  final String gradeClass;
  final int number;
  final bool usingCk;
  final bool boardingCk;
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
    required this.boardingCk,
    required this.roles,
    required this.authorities,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      loginId: json['loginId'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      gradeClass: json['gradeClass'] ?? '',
      number: json['number'] ?? 0,
      usingCk: json['usingCk'] ?? false,
      boardingCk: json['boardingCk'] ?? false,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((roleJson) => Role.fromJson(roleJson))
          .toList() ?? [],
      authorities: (json['authorities'] as List<dynamic>?)
          ?.map((authorityJson) => Authority.fromJson(authorityJson))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'loginId': loginId,
      'name': name,
      'phoneNumber': phoneNumber,
      'gradeClass': gradeClass,
      'number': number,
      'usingCk': usingCk,
      'boardingCk': boardingCk,
      'roles': roles.map((role) => role.toJson()).toList(),
      'authorities': authorities.map((authority) => authority.toJson()).toList(),
    };
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
      id: json['id'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}

class Authority {
  final String authority;

  Authority({
    required this.authority,
  });

  factory Authority.fromJson(Map<String, dynamic> json) {
    return Authority(
      authority: json['authority'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
    };
  }
}

class UserResponse {
  final int status;
  final String message;
  final User data;
  final DateTime timestamp;

  UserResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: User.fromJson(json['data'] ?? {}),
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
