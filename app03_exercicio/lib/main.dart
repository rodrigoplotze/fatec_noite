// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App02',
      home: PrincipalView(),
    );
  }
}

class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

  //
  // Método para criação dinâmica do Container
  //
  Widget criarContainer(texto) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 100,
        decoration: BoxDecoration(border: Border.all(width: 1.0)),
        child: Center(
          child: Text(texto, style: TextStyle(fontSize: 36)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra de Título
      appBar: AppBar(
        title: Text('Texto'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Row(
            children: [
              criarContainer('A'),
              criarContainer('B'),
            ],
          ),
          criarContainer('C'),
          Row(
            children: [
              criarContainer('D'),
              criarContainer('E'),
            ],
          ),
        ],
      ),
    );
  }
}
