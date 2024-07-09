import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_calo_app/src/blocs/bloc.dart';
import 'package:mobile_calo_app/src/navigations/navigation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_calo_app/src/repositories/repository.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: ".env");

  // final authRepository = AuthRepository(
  //   baseUrl: dotenv.env['BASE_URL']!,
  // );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => homeBloc),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.welcomeScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
