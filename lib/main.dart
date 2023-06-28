import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_list/pages/dashboard/dashboard.dart';
import 'package:todo_list/pages/login/login.dart';
import 'app/config/app_colors.dart';
import 'app/storage/local_storage.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  setupLocator();


  bool isAuthenticated = await locator<LocalStorage>().checkToken();
  String initialRoute = '/login';
  if (isAuthenticated) {
    initialRoute = '/dashboard';
  }

  runApp(MyApp(initialRoute: initialRoute));
}


class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    required this.initialRoute,
    super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: dotenv.env['APP_NAME']!,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        secondaryHeaderColor: AppColors.primary,
        brightness: Brightness.light,
        hoverColor: AppColors.dirtyWhite,
        splashColor: const Color.fromARGB(255, 191, 197, 202),
        colorScheme: const ColorScheme.light(primary: AppColors.primary),
        buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary
        ),
        dialogBackgroundColor: Colors.white,
        unselectedWidgetColor: const Color.fromARGB(255, 191, 197, 202),
      ),
      routes: {
        '/login': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
      },
      initialRoute: initialRoute,
    );
  }
}