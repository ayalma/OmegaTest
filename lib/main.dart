

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:omega_evaluation_project/commons/config_interceptor.dart';

import 'package:omega_evaluation_project/ui/home.dart';
import 'package:omega_evaluation_project/ui/home_injector.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'handle_background_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(AppInjector(
    child: OmegaTestApp(),
    preferences: pref,
  ));
  await AndroidAlarmManager.periodic(
      const Duration(minutes: 1), 1, proccessNotification);
}

class OmegaTestApp extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = {
    HomeScreen.route: (context) => HomeInjector(),
  };

  @override
  Widget build(BuildContext context) {
    ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Iran',
      splashColor: Colors.pinkAccent,
      primaryColor: Colors.black,
      accentColor: Colors.pinkAccent,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(behavior: SnackBarBehavior.floating),
      dialogTheme: DialogTheme(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
        splashColor: Colors.pinkAccent,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );

    ThemeData darkTheme = lightTheme.copyWith(brightness: Brightness.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'برنامه تستی امگا',
      locale: Locale('fa'),
      supportedLocales: [
        const Locale.fromSubtags(languageCode: 'fa'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routes: routes,
      darkTheme: darkTheme,
      theme: lightTheme,
      initialRoute: HomeScreen.route,
    );
  }
}

class AppInjector extends StatelessWidget {
  final Widget child;
  final SharedPreferences preferences;

  const AppInjector({
    Key key,
    this.child,
    this.preferences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: preferences),
        Provider.value(value: ConfigInterceptor()),
        ProxyProvider<ConfigInterceptor, Dio>(
          update: (_, authTokenInterceptor, __) {
            Dio dio = Dio();
            dio.interceptors.add(authTokenInterceptor);
            return dio;
          },
        ),
      ],
      child: child,
    );
  }
}
