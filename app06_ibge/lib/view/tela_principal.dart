import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/pais.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //Lista Dinâmica para armazenamento de
  //objetos do modelo de dados Pais
  List<Pais> lista = [];

  //
  // CARREGAR UM ARQUIVO JSON
  //
  carregarJson() async {
    final String arquivo = await rootBundle.loadString('lib/data/paises.json');
    final dynamic data = await json.decode(arquivo);

    //percorrer o arquivo
    setState(() {
      data.forEach((item) {
        lista.add(Pais.fromJson(item));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await carregarJson();
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.place),
              trailing: const Icon(Icons.arrow_right),
              title: Text(lista[index].nome),
              subtitle: Text(
                'Capital: ${lista[index].capital} / Área: ${lista[index].area} km²',
              ),
              //
              // Navegar para a tela de detalhes
              //
              onTap: () {
                //print(lista[index].nome);
                Navigator.pushNamed(
                  context,
                  't2',
                  arguments: lista[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
