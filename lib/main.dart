import 'package:flutter/material.dart';

import 'core/singletons/app_singleton.dart';
import 'features/auth/screens/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      navigatorKey: SingletonService().key,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const  AuthenticationScreen(),
    );
  }
}


