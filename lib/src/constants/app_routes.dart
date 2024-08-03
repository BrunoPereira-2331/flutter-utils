// enum AppRoutes {
//   _loginScreen(id: 1, route: '/login'),
//   _homeScreen(id: 2, route: '/home');

//   const AppRoutes({required this.id, required this.route});

//   final int id;
//   final String route;

//   static String get loginScreen => _loginScreen.route;
//   static String get homeScreen => _homeScreen.route;

  
// }

class AppRoutes {
  static const String loginScreen = "/login";
  static const String homeScreen = "/home";
  static const String singletonPattern = "/singleton";
  static const String taskList= "/taskList";
  static const String singletonTaskListScreen = singletonPattern + taskList;
}

