// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Tela1View extends StatefulWidget {
  const Tela1View({super.key});

  @override
  State<Tela1View> createState() => _Tela1ViewState();
}

class _Tela1ViewState extends State<Tela1View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
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

                String nome = 'João da Silva';

                Navigator.pushNamed(
                  context,
                  't2',
                  arguments: nome,
                );
              },
              child: Text('abrir'),
            ),
          ],
        ),
      ),
    );
  }
}
