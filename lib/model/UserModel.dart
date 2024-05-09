class UserData {
  final String id;
  final String loginId;
  final String pw;
  final String name;
  final int grade;
  final int classNumber;
  final int number;
  final List<Role> roles;
  final List<Authority> authorities;
  final String timestamp;

  UserData({
    required this.id,
    required this.loginId,
    required this.pw,
    required this.name,
    required this.grade,
    required this.classNumber,
    required this.number,
    required this.roles,
    required this.authorities,
    required this.timestamp,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['data']['id'],
      loginId: json['data']['loginId'],
      pw: json['data']['pw'],
      name: json['data']['name'],
      grade: json['data']['grade'],
      classNumber: json['data']['classNumber'],
      number: json['data']['number'],
      roles: List<Role>.from(json['data']['roles'].map((role) => Role.fromJson(role))),
      authorities: List<Authority>.from(json['data']['authorities'].map((authority) => Authority.fromJson(authority))),
      timestamp: json['timestamp'],
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
      name: json['name'],
      description: json['description'],
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
