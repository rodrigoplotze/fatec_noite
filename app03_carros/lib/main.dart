import 'package:flutter/material.dart';

import 'carro_widget.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebCars',
      home: TelaPrincipal(),
    ),
  );
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebCars'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CarroWidget("Audi", "Q8", "lib/imagens/audi_q8.jpg"),
            CarroWidget("Audi", "R8", "lib/imagens/audi_r8.jpg"),
            CarroWidget("BMW", "M2", "lib/imagens/bmw_m2.jpg"),
            CarroWidget("Ferrari", "488", "lib/imagens/ferrari_488.jpg"),
            CarroWidget("Lamborghini", "Huracan", "lib/imagens/lamborghini_huracan.jpg"),
            CarroWidget("Lamborghini", "Urus", "lib/imagens/lamborghini_urus.jpg"),
            CarroWidget("Masserati", "GTS", "lib/imagens/maserati_gts.jpg"),
          ],
        ),
      ),
    );
  }
}
