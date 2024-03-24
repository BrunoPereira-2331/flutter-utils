enum AppRoutes {
  _loginScreen(value: 1, route: '/login'),
  _homeScreen(value: 2, route: '/home');

  const AppRoutes({required this.value, required this.route});

  final int value;
  final String route;

  static String get loginScreen => _loginScreen.route;
  static String get homeScreen => _homeScreen.route;

  
}