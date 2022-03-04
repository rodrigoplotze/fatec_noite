import 'package:flutter/material.dart';

class CarroWidget extends StatelessWidget {
  //Atributos
  final String marca;
  final String modelo;
  final String imagem;

  const CarroWidget(this.marca, this.modelo, this.imagem, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      padding: const EdgeInsets.fromLTRB(10,10,10,10),

      color: Colors.grey.shade300,
      width: double.infinity,
      height: 350,
      child: Column(
        children: [
          Text(marca, style: const TextStyle(fontSize: 28),),
          Text(modelo, style: const TextStyle(fontSize: 28),),
          const SizedBox(height: 10,),
          Image.asset(imagem),
        ],
      ),
    );
  }
}
