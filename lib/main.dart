import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/preference_helper.dart';
import 'package:emi_calculation/core/route.dart';
import 'package:emi_calculation/core/route_generator.dart';
import 'package:emi_calculation/core/string_utils/string_utils.dart';
import 'package:emi_calculation/firebase/firebase_options.dart';
import 'package:emi_calculation/screen/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
  PreferenceHelper.load().then((value) {});
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
      ],
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      path: languagePath,
      child: MyApp(savedThemeMode: savedThemeMode)));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: fontPoppins,
              fontWeight: FontWeight.w600),
        ),
        brightness: Brightness.light,
        iconTheme: const IconThemeData(color: Colors.black),
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: fontPoppins,
              fontWeight: FontWeight.w600),
        ),
        useMaterial3: true,
        iconTheme: const IconThemeData(color: Colors.white),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
        ),
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      debugShowFloatingThemeButton: false,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: appName,
        theme: theme,
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        darkTheme: darkTheme,
      ),
    );
  }
}
