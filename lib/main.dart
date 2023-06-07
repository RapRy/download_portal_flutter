import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'dart:io';

// screen imports
import 'ui/screens/auth/sign_in_screen.dart';
import 'ui/screens/home/home.dart';

// routes
import "./routes/routes.dart";

// provider
import "./provider/preference/preference_provider.dart";
import './provider/auth/sign_in_provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  HttpOverrides.global = MyHttpOverrides();

  runApp(ProviderScope(overrides: [
    sharedPreferenceProvider.overrideWithValue(prefs),
  ], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasCredentials =
        ref.watch(preferenceProvider).hasStorageCredentials();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0.0),
          textTheme: const TextTheme(
            displayMedium: TextStyle(
              fontSize: 23,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          )),
      initialRoute: hasCredentials ? Home.routeName : SignInScreen.routeName,
      onGenerateRoute: (settings) => RouterNames().generateRoute(settings),
    );
  }
}
