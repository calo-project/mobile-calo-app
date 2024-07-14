part of 'navigation.dart';

class Routes {
  static const String welcomeScreen = '/';
  static const String homeScreen = '/home_screen';
  static const String homeFragment = '/home_fragment';
  static const String eventFragment = '/event_fragment';
  static const String historyFragment = '/history_fragment';
  static const String profileFragment = '/profile_fragment';
  static const String signInScreen = '/sign_in_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String detailEventScreen = '/detail_event_screen';
  static const String detailHistoryScreen = '/detail_history_screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );
      case homeFragment:
        return MaterialPageRoute(
          builder: (_) => const HomeFragment(),
          settings: settings,
        );
      case eventFragment:
        return MaterialPageRoute(
          builder: (_) => const EventFragment(),
          settings: settings,
        );
      case historyFragment:
        return MaterialPageRoute(
          builder: (_) => const HistoryFragment(),
          settings: settings,
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case profileFragment:
        return MaterialPageRoute(
          builder: (_) => const ProfileFragment(),
          settings: settings,
        );
      case signInScreen:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
          settings: settings,
        );
      case detailEventScreen:
        return MaterialPageRoute(
          builder: (_) => const DetailEventScreen(),
          settings: settings,
        );
      case detailHistoryScreen:
        return MaterialPageRoute(
          builder: (_) => const DetailHistoryScreen(),
          settings: settings,
        );
      case signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
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

void navigatePushReplacement(String newRouteName) {
  navigatorKey.currentState?.pushReplacementNamed(newRouteName);
}

void navigateAndRemoveUntil(BuildContext context, String newRouteName) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    newRouteName,
    (Route<dynamic> route) => false,
  );
}
