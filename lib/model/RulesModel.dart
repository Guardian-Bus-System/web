class Rule {
  final int number;
  final String content;

  Rule({
    required this.number,
    required this.content,
  });

  // JSON 데이터를 Rule 객체로 변환
  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      number: json['number'],
      content: json['content'],
    );
  }

  // Rule 객체를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'content': content,
    };
  }
}

class RuleResponse {
  final int status;
  final String message;
  final List<Rule> data;
  final DateTime timestamp;

  RuleResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory RuleResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Rule> ruleList = list.map((item) => Rule.fromJson(item)).toList();

    return RuleResponse(
      status: json['status'],
      message: json['message'],
      data: ruleList,
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((rule) => rule.toJson()).toList(),
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
