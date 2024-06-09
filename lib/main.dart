import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_calo_app/src/blocs/bloc.dart';
import 'package:mobile_calo_app/src/models/model.dart';
import 'package:mobile_calo_app/src/navigations/navigation.dart';
import 'package:mobile_calo_app/src/presentations/screens/screen.dart';
import 'package:mobile_calo_app/src/repositories/repository.dart';
import 'package:mobile_calo_app/src/services/service.dart';
import 'package:mobile_calo_app/src/utils/util.dart';
import 'package:mobile_calo_app/src/presentations/fragments/fragment.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await dotenv.load(fileName: ".env");

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.welcomeScreen,
        onGenerateRoute: Routes.generateRoute,
      );
  }
}