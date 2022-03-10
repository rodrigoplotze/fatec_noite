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
      //margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.fromLTRB(10,10,10,10),

      //BORDA
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade900,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade300,
      ),


      

      width: double.infinity,
      height: 350,
      child: Column(
        children: [
          Text(marca, style: const TextStyle(fontSize: 28),),
          Text(modelo, style: const TextStyle(fontSize: 28),),
          const SizedBox(height: 10,),
          Image.asset(imagem, scale: 1.8,),
        ],
      ),
    );
  }
}
