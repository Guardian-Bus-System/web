import 'dart:convert';

// Top-level model class
class UserBusListResponse {
  final int status;
  final String message;
  final List<UserBus> data;
  final DateTime timestamp;

  UserBusListResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  // Factory method to create an instance from a JSON map
  factory UserBusListResponse.fromJson(Map<String, dynamic> json) {
    return UserBusListResponse(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List).map((i) => UserBus.fromJson(i)).toList(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // Method to convert the instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((bus) => bus.toJson()).toList(),
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

// Bus model class
class UserBus {
  final int id;
  final int busNumber;
  final String busName;
  final String titleCityName;
  final List<Town> towns;
  final int maxTable;
  final DateTime createdAt;
  final DateTime updateAt;

  UserBus({
    required this.id,
    required this.busNumber,
    required this.busName,
    required this.titleCityName,
    required this.towns,
    required this.maxTable,
    required this.createdAt,
    required this.updateAt,
  });

  factory UserBus.fromJson(Map<String, dynamic> json) {
    return UserBus(
      id: json['id'],
      busNumber: json['busNumber'],
      busName: json['busName'],
      titleCityName: json['titleCityName'],
      towns: (json['towns'] as List).map((i) => Town.fromJson(i)).toList(),
      maxTable: json['maxTable'],
      createdAt: DateTime.parse(json['createdAt']),
      updateAt: DateTime.parse(json['updateAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'busNumber': busNumber,
      'busName': busName,
      'titleCityName': titleCityName,
      'towns': towns.map((town) => town.toJson()).toList(),
      'maxTable': maxTable,
      'createdAt': createdAt.toIso8601String(),
      'updateAt': updateAt.toIso8601String(),
    };
  }
}

// Town model class
class Town {
  final int id;
  final String townName;
  final List<Village> busVillages;

  Town({
    required this.id,
    required this.townName,
    required this.busVillages,
  });

  factory Town.fromJson(Map<String, dynamic> json) {
    return Town(
      id: json['id'],
      townName: json['townName'],
      busVillages: (json['busVillages'] as List)
          .map((i) => Village.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'townName': townName,
      'busVillages': busVillages.map((village) => village.toJson()).toList(),
    };
  }
}

// Village model class
class Village {
  final int id;
  final String villageName;

  Village({
    required this.id,
    required this.villageName,
  });

  factory Village.fromJson(Map<String, dynamic> json) {
    return Village(
      id: json['id'],
      villageName: json['villageName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'villageName': villageName,
    };
  }
}
