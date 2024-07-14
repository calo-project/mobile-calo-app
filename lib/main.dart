import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_widget/m_widget.dart';
import 'package:mobile_calo_app/src/blocs/bloc.dart';
import 'package:mobile_calo_app/src/navigations/navigation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobile_calo_app/src/presentations/screens/screen.dart';
import 'package:mobile_calo_app/src/services/service.dart';
import 'package:mobile_calo_app/src/utils/util.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: ".env");

  await MWidget.initialize();

  // final authRepository = AuthRepository(
  //   baseUrl: dotenv.env['BASE_URL']!,
  // );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  try {
    await ApiClient.signInWithToken();
  } catch (e) {
    ApiClient.handleError(e);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static AuthenticationBloc authBloc = AuthenticationBloc();
  static HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => authBloc),
        BlocProvider(create: (context) => homeBloc),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: currentUser == null ? Routes.welcomeScreen : Routes.homeScreen,
        onGenerateRoute: Routes.generateRoute,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
