class ApiEndPoints {
  static const String  baseUrl = "http://localhost:8097";
  static const String adminBaseUrl = "http://localhost:8097/admin";
  // ignore: library_private_types_in_public_api
  
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
  static _AuthAdminEndPotins authAdminEndPoints = _AuthAdminEndPotins();
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

class _AuthAdminEndPotins{
  final String userListInfo = " ";
}
