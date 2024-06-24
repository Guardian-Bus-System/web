class ApiEndPoints {
  static const String  baseUrl = "http://APIs";
  // ignore: library_private_types_in_public_api
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints{
  final String registerEmail = "register";
  final String loginEmail = "auth/login";
  final String refreashToken = "auth/refresh";
  final String joinUser = "users/me";
  final String busInfo = "buses/";
}