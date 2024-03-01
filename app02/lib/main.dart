// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra de Título
      appBar: AppBar(
        title: Text('App'),
        backgroundColor: Colors.blue,
      ),

      body: Column(

        //Alinhamento EIXO Principal
        mainAxisAlignment: MainAxisAlignment.start,

        //Alinhamento EIXO Secundário
        crossAxisAlignment: CrossAxisAlignment.start,    

        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Row(

            //Alinhamento EIXO Principal
            mainAxisAlignment: MainAxisAlignment.start,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.purple,
              ),
              
              Column(
                children: [
                  Icon(
                    Icons.directions_bike,
                    size: 50,
                    color: Colors.blue.shade900,
                  ),
                  Icon(
                    Icons.directions_bus,
                    size: 50,
                    color: Colors.red.shade900,
                  ),
                ],
              ),
            ],
          ),


        ],
      ),
    );
  }
}
