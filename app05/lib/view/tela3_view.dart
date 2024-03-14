// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Tela3View extends StatefulWidget {
  const Tela3View({super.key});

  @override
  State<Tela3View> createState() => _Tela3ViewState();
}

class _Tela3ViewState extends State<Tela3View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 3'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                //
                // Navegar para Tela 2
                //
                Navigator.pop(context);
              },
              child: Text('voltar'),
            ),
            OutlinedButton(
              onPressed: () {
                //
                // Navegar para Tela 4
                //
                Navigator.pushNamed(context, 't4');
              },
              child: Text('abrir'),
            ),
          ],
        ),
      ),
    );
  }
}
