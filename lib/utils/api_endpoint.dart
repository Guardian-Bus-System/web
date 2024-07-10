class ApiEndPoints {
  static const String  baseUrl = "http://172.28.5.72:8097";
  // ignore: library_private_types_in_public_api
  //기숙사 172.16.1.142
  //학교 172.28.5.72
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints{
  final String registerEmail = "/register";
  final String loginEmail = "/auth/login";
  final String refreashToken = "/auth/refresh";
  final String userInformation = "/users";
  final String cerficationSend = "/send-verification-code";
  final String cerficationVerify = "/verify-code";
  final String pwUpdate = "/change-password";
  final String userBusApi = "/buses";
  final String bus = "/bus";
  final String cities = "/cities";
  final String userMe = "/me";
  final String userReservationsApi = "/reservations";
  final String citysApi = "/cities";
  final String notices = "/notices";
  final String rules = "/rules";
}
