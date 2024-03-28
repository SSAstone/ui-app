class ApiEndPoints {
  static const String baseUrl = 'http://192.168.0.104:5550';
  static AuthEndPoints authEndpoints = AuthEndPoints();
}

class AuthEndPoints {
  final String register = 'authaccount/registration';
  final String login = '/user/login';
  final String getUser = '/user/me';
}