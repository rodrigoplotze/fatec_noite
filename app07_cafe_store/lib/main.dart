import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/criar_conta_page.dart';
import 'pages/login_page.dart';
import 'pages/principal_page.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Café Store',
      initialRoute: 'login',
      routes: {
        'login' :(context) => const LoginPage(),
        'criar_conta' :(context) => const CriarContaPage(),
        'principal' :(context) => const PrincipalPage(),
      },
    ),
  );
}
