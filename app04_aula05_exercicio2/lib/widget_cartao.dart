import 'package:flutter/material.dart';

class WidgetCartao extends StatelessWidget {
  final Icon icone;
  final String titulo;
  final String corpo;

  const WidgetCartao(this.icone, this.titulo, this.corpo, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Column(
        children: [
          ListTile(
            leading: icone,
            title: Text(
              titulo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: const Color.fromRGBO(187, 222, 251, 1),
          ),
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Text(
              corpo,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Container(
            color: const Color.fromRGBO(187, 222, 251, 1),
            height: 50,
            child: Row(
              children: const [
                Text('Explore'),
                SizedBox(width: 10,),
                Icon(Icons.arrow_right_alt_outlined),
              ],
            ),
          )
        ],
      ),
    );
  }
}
