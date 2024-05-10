
class BusData {
  final int id;
  final int busNumber;
  final String line;
  final String endLine;
  final int maxTable;
  final String createdAt;
  final String updateAt;
  final String timestamp;

  BusData({
    required this.id, 
    required this.busNumber, 
    required this.line, 
    required this.endLine, 
    required this.maxTable, 
    required this.createdAt, 
    required this.updateAt, 
    required this.timestamp
  });

  
  factory BusData.fromJson(Map<String, dynamic> json) {
    return BusData(
      id: json['id'] ?? 0, // 값이 없는 경우 기본값 0으로 설정
      busNumber: json['busNumber'] ?? 1000,
      line: json['line'] ?? '',
      endLine: json['endLine'] ?? '',
      maxTable: json['maxTable'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updateAt: json['updateAt'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }
}
