class UserData {
  final String id;
  final String loginId;
  final String pw;
  final String name;
  final String phoneNumber;
  final String gradeClass;
  final int number;
  final List<Role> roles;
  final List<Authority> authorities;
  final String timestamp;

  UserData({
    required this.id,
    required this.loginId,
    required this.pw,
    required this.name,
    required this.phoneNumber,
    required this.gradeClass,
    required this.number,
    required this.roles,
    required this.authorities,
    required this.timestamp,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      loginId: json['loginId'] ?? '',
      pw: json['pw'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      gradeClass: json['gradeClass'] ?? '',
      number: json['number'] ?? 0, // nullable일 경우 기본값 0 설정
      roles: (json['roles'] as List<dynamic>?)
              ?.map((role) => Role.fromJson(role))
              .toList() ?? [], // 빈 리스트로 초기화
      authorities: (json['authorities'] as List<dynamic>?)
              ?.map((authority) => Authority.fromJson(authority))
              .toList() ?? [], // 빈 리스트로 초기화
      timestamp: json['timestamp'] ?? '',
    );
  }
}

class Role {
  final String name;
  final String description;

  Role({
    required this.name,
    required this.description,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
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
      authority: json['authority'] ?? '',
    );
  }
}
