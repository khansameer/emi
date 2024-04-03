import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/ModelTheme.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/preference_helper.dart';
import 'package:emi_calculation/core/string_utils/string_utils.dart';
import 'package:emi_calculation/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: const MyApp()));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
        return MaterialApp(
          title: appName,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // theme: themeNotifier.isDark
          //     ? ThemeData(
          //         brightness: Brightness.dark,
          //         primaryColor: Colors.red,
          //         primarySwatch: Colors.red)
          //     : ThemeData(
          //         brightness: Brightness.light,
          //         primaryColor: Colors.green,
          //         primarySwatch: Colors.green),
          home: const SplashScreen(),
        );
      }),
    );
  }
}
