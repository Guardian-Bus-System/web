import 'dart:convert';

class Notice {
  final int id;
  final String? content;
  final DateTime createAt;
  final DateTime updateAt;
  final bool views;
  final List<ViewsUser> viewsUser;

  Notice({
    required this.id,
    this.content,
    required this.createAt,
    required this.updateAt,
    required this.views,
    required this.viewsUser,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    try {
      return Notice(
        id: json['id'] ?? 0,
        content: json['content'] as String?,
        createAt: json['createAt'] != null ? DateTime.parse(json['createAt']) : DateTime.now(),
        updateAt: json['updateAt'] != null ? DateTime.parse(json['updateAt']) : DateTime.now(),
        views: json['views'] ?? false,
        viewsUser: (json['viewsUser'] as List<dynamic>?)
                ?.map((e) => ViewsUser.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );
    } catch (e) {
      print('Failed to parse Notice: $e');
      throw e; // 예외를 다시 던져서 호출자에서 처리할 수 있도록 함
    }
  }
}

class ViewsUser {
  final int id;
  final String views;

  ViewsUser({
    required this.id,
    required this.views,
  });

  factory ViewsUser.fromJson(Map<String, dynamic> json) {
    return ViewsUser(
      id: json['id'] ?? 0,
      views: json['views'] as String? ?? '',
    );
  }
}

class NoticeData {
  final int totalPages;
  final int totalElements;
  final bool first;
  final bool last;
  final int numberOfElements;
  final int size;
  final List<Notice> content;
  final int number;
  final Sort sort;
  final Pageable pageable;
  final bool empty;

  NoticeData({
    required this.totalPages,
    required this.totalElements,
    required this.first,
    required this.last,
    required this.numberOfElements,
    required this.size,
    required this.content,
    required this.number,
    required this.sort,
    required this.pageable,
    required this.empty,
  });

  factory NoticeData.fromJson(Map<String, dynamic> json) {
    return NoticeData(
      totalPages: json['totalPages'] ?? 0,
      totalElements: json['totalElements'] ?? 0,
      first: json['first'] ?? false,
      last: json['last'] ?? false,
      numberOfElements: json['numberOfElements'] ?? 0,
      size: json['size'] ?? 0,
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => Notice.fromJson(e))
              .toList() ??
          [],
      number: json['number'] ?? 0,
      sort: Sort.fromJson(json['sort'] ?? {}),
      pageable: Pageable.fromJson(json['pageable'] ?? {}),
      empty: json['empty'] ?? false,
    );
  }
}

class Sort {
  final bool empty;
  final bool sorted;
  final bool unsorted;

  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      empty: json['empty'] ?? false,
      sorted: json['sorted'] ?? false,
      unsorted: json['unsorted'] ?? false,
    );
  }
}

class Pageable {
  final int offset;
  final Sort sort;
  final int pageNumber;
  final int pageSize;
  final bool paged;
  final bool unpaged;

  Pageable({
    required this.offset,
    required this.sort,
    required this.pageNumber,
    required this.pageSize,
    required this.paged,
    required this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      offset: json['offset'] ?? 0,
      sort: Sort.fromJson(json['sort'] ?? {}),
      pageNumber: json['pageNumber'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      paged: json['paged'] ?? false,
      unpaged: json['unpaged'] ?? false,
    );
  }
}

class NoticeResponse {
  final int status;
  final String message;
  final NoticeData data;
  final DateTime timestamp;

  NoticeResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory NoticeResponse.fromJson(Map<String, dynamic> json) {
    return NoticeResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: NoticeData.fromJson(json['data'] ?? {}),
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp']) : DateTime.now(),
    );
  }
}