import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_calo_app/src/blocs/bloc.dart';
import 'package:mobile_calo_app/src/navigations/navigation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_calo_app/src/repositories/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  final authRepository = AuthRepository(
    baseUrl: dotenv.env['BASE_URL']!,
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: authRepository)..add(CheckAuthEvent()),
      child: MaterialApp(
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedIconTheme: const IconThemeData(color: Colors.purple),
            unselectedIconTheme: IconThemeData(color: Colors.blue[300]),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.welcomeScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
