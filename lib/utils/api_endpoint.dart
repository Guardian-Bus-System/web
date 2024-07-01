class ApiEndPoints {
  static const String  baseUrl = "http://172.28.5.72:8097";
  // ignore: library_private_types_in_public_api
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints{
  final String registerEmail = "/register";
  final String loginEmail = "/auth/login";
  final String refreashToken = "/auth/refresh";
  final String userInformation = "/users/me";
  final String busInformation = "/buses";
  final String notices = "/notices";
  final String rules = "/rules";
}
