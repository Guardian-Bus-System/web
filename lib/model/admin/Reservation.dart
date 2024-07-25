import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// 데이터 모델 정의
class AdminReservation {
  final String id;
  final AdminUser user;
  final AdminBusInfo busInfo;
  final String endCity;
  final bool onCk;
  final DateTime createAt;
  final DateTime? updateAt;

  AdminReservation({
    required this.id,
    required this.user,
    required this.busInfo,
    required this.endCity,
    required this.onCk,
    required this.createAt,
    this.updateAt,
  });

  factory AdminReservation.fromJson(Map<String, dynamic> json) {
    return AdminReservation(
      id: json['id'],
      user: AdminUser.fromJson(json['user']),
      busInfo: AdminBusInfo.fromJson(json['busInfo']),
      endCity: json['endCity'],
      onCk: json['onCk'],
      createAt: DateTime.parse(json['createAt']),
      updateAt: json['updateAt'] != null ? DateTime.parse(json['updateAt']) : null,
    );
  }
}

class AdminUser {
  final String id;
  final String loginId;
  final String name;
  final String phoneNumber;
  final String gradeClass;
  final int number;
  final bool usingCk;
  final bool? boardingCk;
  final List<AdminRole> roles;
  final List<AdminAuthority> authorities;

  AdminUser({
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

  factory AdminUser.fromJson(Map<String, dynamic> json) {
    return AdminUser(
      id: json['id'],
      loginId: json['loginId'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      gradeClass: json['gradeClass'],
      number: json['number'],
      usingCk: json['usingCk'],
      boardingCk: json['boardingCk'],
      roles: (json['roles'] as List).map((i) => AdminRole.fromJson(i)).toList(),
      authorities: (json['authorities'] as List).map((i) => AdminAuthority.fromJson(i)).toList(),
    );
  }
}

class AdminRole {
  final String id;
  final String title;

  AdminRole({required this.id, required this.title});

  factory AdminRole.fromJson(Map<String, dynamic> json) {
    return AdminRole(
      id: json['id'],
      title: json['title'],
    );
  }
}

class AdminAuthority {
  final String authority;

  AdminAuthority({required this.authority});

  factory AdminAuthority.fromJson(Map<String, dynamic> json) {
    return AdminAuthority(
      authority: json['authority'],
    );
  }
}

class AdminBusInfo {
  final int id;
  final int busNumber;
  final String busName;
  final String titleCityName;
  final List<AdminTown> towns;
  final int maxTable;
  final DateTime createdAt;
  final DateTime updateAt;

  AdminBusInfo({
    required this.id,
    required this.busNumber,
    required this.busName,
    required this.titleCityName,
    required this.towns,
    required this.maxTable,
    required this.createdAt,
    required this.updateAt,
  });

  factory AdminBusInfo.fromJson(Map<String, dynamic> json) {
    return AdminBusInfo(
      id: json['id'],
      busNumber: json['busNumber'],
      busName: json['busName'],
      titleCityName: json['titleCityName'],
      towns: (json['towns'] as List).map((i) => AdminTown.fromJson(i)).toList(),
      maxTable: json['maxTable'],
      createdAt: DateTime.parse(json['createdAt']),
      updateAt: DateTime.parse(json['updateAt']),
    );
  }
}

class AdminTown {
  final int id;
  final String townName;
  final List<AdminBusVillage> busVillages;

  AdminTown({required this.id, required this.townName, required this.busVillages});

  factory AdminTown.fromJson(Map<String, dynamic> json) {
    return AdminTown(
      id: json['id'],
      townName: json['townName'],
      busVillages: (json['busVillages'] as List).map((i) => AdminBusVillage.fromJson(i)).toList(),
    );
  }
}

class AdminBusVillage {
  final int id;
  final String villageName;

  AdminBusVillage({required this.id, required this.villageName});

  factory AdminBusVillage.fromJson(Map<String, dynamic> json) {
    return AdminBusVillage(
      id: json['id'],
      villageName: json['villageName'],
    );
  }
}
