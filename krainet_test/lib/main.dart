import 'dart:async';

import 'package:flutter/material.dart';
import 'package:krainet_test/models/enter/enter_route.dart';
import 'package:krainet_test/models/splash_page/splash_route.dart';
import 'package:krainet_test/theme/custom_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'domain/user_data.dart';
import 'firebase_options.dart';
import 'models/main_page/main_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PixelsApp());
}

class PixelsApp extends StatefulWidget {
  const PixelsApp({Key? key}) : super(key: key);

  @override
  State<PixelsApp> createState() => PixelsAppState();
}

class PixelsAppState extends State<PixelsApp> {
  @override
  void initState() {
    super.initState();
  }

  final isLoggedProcess = Future.delayed(
    const Duration(seconds: 2),
    () async => UserData.isLoggedIn(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PixelsTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Pixels App',
      home: Builder(
        builder: (context) {
          isLoggedProcess.then(
            (value) {
              if (value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainRoute(),
                  ),
                  (route) => false,
                );
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EnterRoute(),
                  ),
                  (route) => false,
                );
              }
            },
          );
          return const SplashRoute();
        },
      ),
    );
  }
}
