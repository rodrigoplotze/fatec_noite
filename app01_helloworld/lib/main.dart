// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {

  //chamar o framework Flutter
  runApp(
    
    //chamar o plugin do Device Preview
    DevicePreview(
      enabled: true,
      builder: (context) => const PrincipalView(),
    ),

  );
}

//
// TELA PRINCIPAL
// Stateless ==> stl+TAB
class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //Cor do fundo do body
        backgroundColor: Colors.yellow.shade200,
        //Corpo do App
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
