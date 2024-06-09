part of 'navigation.dart';

class Routes {
  static const String welcomeScreen = '/';
  static const String homeScreen = '/home';
  static const String ticketScreen = '/ticket';
  static const String historyScreen = '/history';
  static const String profileScreen = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeFragment(),
          settings: settings,
        );
      case ticketScreen:
        return MaterialPageRoute(
          builder: (_) => const TicketFragment(),
          settings: settings,
        );
      case historyScreen:
        return MaterialPageRoute(
          builder: (_) => const HistoryFragment(),
          settings: settings,
        );
      case profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileFragment(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}

void navigateAndRemoveUntil(BuildContext context, String newRouteName) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    newRouteName,
    (Route<dynamic> route) => false,
  );
}