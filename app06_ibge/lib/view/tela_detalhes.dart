import 'package:flutter/material.dart';

import '../model/pais.dart';

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({Key? key}) : super(key: key);

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  Widget build(BuildContext context) {
    //
    // Receber o argumento passado como parâmetro
    //
    final Pais p = ModalRoute.of(context)!.settings.arguments as Pais;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IBGE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Image.network('https://countryflagsapi.com/png/' +
                p.abreviatura.toLowerCase()),
            Text(p.historico),
          ],
        ),
      ),
    );
  }
}
