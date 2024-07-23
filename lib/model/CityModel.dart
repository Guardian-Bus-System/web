// bus_city.dart
class BusCity {
  final int id;
  final String name;

  BusCity({
    required this.id,
    required this.name,
  });

  // JSON 데이터를 BusCity 인스턴스로 변환
  factory BusCity.fromJson(Map<String, dynamic> json) {
    return BusCity(
      id: json['id'],
      name: json['name'],
    );
  }

  // BusCity 인스턴스를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class BusCityResponse {
  final int status;
  final String message;
  final List<BusCity> data;
  final String timestamp;

  BusCityResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  // JSON 데이터를 BusCityResponse 인스턴스로 변환
  factory BusCityResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List; // 'data'는 리스트 형태의 데이터임을 명시
    List<BusCity> cities = dataList.map((item) => BusCity.fromJson(item)).toList();

    return BusCityResponse(
      status: json['status'],
      message: json['message'],
      data: cities,
      timestamp: json['timestamp'],
    );
  }

  // BusCityResponse 인스턴스를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((city) => city.toJson()).toList(),
      'timestamp': timestamp,
    };
  }
}
