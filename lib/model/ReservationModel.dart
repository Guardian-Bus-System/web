class ReservationResponse {
  final int status;
  final String message;
  final ReservationData? data; // Nullable 처리
  final DateTime timestamp;

  ReservationResponse({
    required this.status,
    required this.message,
    this.data, // Nullable 처리
    required this.timestamp,
  });

  factory ReservationResponse.fromJson(Map<String, dynamic> json) {
    return ReservationResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null ? ReservationData.fromJson(json['data']) : null, // null 확인
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()), // 기본값 제공
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(), // Nullable이므로 안전 연산자 사용
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class ReservationData {
  final String id;
  final BusInfo busInfo;
  final String endCity;
  final DateTime createAt;
  final DateTime updateAt;
  final bool onCk;

  ReservationData({
    required this.id,
    required this.busInfo,
    required this.endCity,
    required this.createAt,
    required this.updateAt,
    required this.onCk
  });

  factory ReservationData.fromJson(Map<String, dynamic> json) {
    return ReservationData(
      id: json['id'] ?? '', // 기본값 제공
      busInfo: BusInfo.fromJson(json['busInfo'] ?? {}), // 빈 객체 제공
      endCity: json['endCity'] ?? '', // 기본값 제공
      createAt: DateTime.parse(json['createAt'] ?? DateTime.now().toIso8601String()), // 기본값 제공
      updateAt: DateTime.parse(json['updateAt'] ?? DateTime.now().toIso8601String()), 
      onCk: true, // 기본값 제공
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'busInfo': busInfo.toJson(),
      'endCity': endCity,
      'createAt': createAt.toIso8601String(),
      'updateAt': updateAt.toIso8601String(),
      'onCk': onCk
    };
  }
}

class BusInfo {
  final int id;
  final int busNumber;
  final String busName;
  final String titleCityName;
  final List<Town> towns;
  final int maxTable;

  BusInfo({
    required this.id,
    required this.busNumber,
    required this.busName,
    required this.titleCityName,
    required this.towns,
    required this.maxTable,
  });

  factory BusInfo.fromJson(Map<String, dynamic> json) {
    return BusInfo(
      id: json['id'] ?? 0, // 기본값 제공
      busNumber: json['busNumber'] ?? 0, // 기본값 제공
      busName: json['busName'] ?? '', // 기본값 제공
      titleCityName: json['titleCityName'] ?? '', // 기본값 제공
      towns: (json['towns'] as List<dynamic>?)
              ?.map((e) => Town.fromJson(e as Map<String, dynamic>))
              .toList() ?? [], // 기본값 제공
      maxTable: json['maxTable'] ?? 0, // 기본값 제공
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'busNumber': busNumber,
      'busName': busName,
      'titleCityName': titleCityName,
      'towns': towns.map((e) => e.toJson()).toList(),
      'maxTable': maxTable,
    };
  }
}

class Town {
  final int id;
  final String townName;
  final List<BusVillage> busVillages;

  Town({
    required this.id,
    required this.townName,
    required this.busVillages,
  });

  factory Town.fromJson(Map<String, dynamic> json) {
    return Town(
      id: json['id'] ?? 0, // 기본값 제공
      townName: json['townName'] ?? '', // 기본값 제공
      busVillages: (json['busVillages'] as List<dynamic>?)
                    ?.map((e) => BusVillage.fromJson(e as Map<String, dynamic>))
                    .toList() ?? [], // 기본값 제공
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

class BusVillage {
  final int id;
  final String villageName;

  BusVillage({
    required this.id,
    required this.villageName,
  });

  factory BusVillage.fromJson(Map<String, dynamic> json) {
    return BusVillage(
      id: json['id'] ?? 0, // 기본값 제공
      villageName: json['villageName'] ?? '', // 기본값 제공
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'villageName': villageName,
    };
  }
}
