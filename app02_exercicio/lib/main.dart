import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício',
      home: TelaPrincipal(),
    ),
  );
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // BARRA DE TÍTULO
      //
      appBar: AppBar(
        title: const Text('Exercício'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade600,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
        ],
      ),

      //
      // CORPO
      //
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.20,
                color: Colors.deepPurple.shade100,
                child: const Center(child: Text('A')),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.20,
                color: Colors.deepPurple.shade300,
                child: const Center(child: Text('B')),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.46,
                color: Colors.grey.shade300,
                child: const Center(child: Text('C')),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.20,
                color: Colors.deepPurple.shade100,
                child: const Center(child: Text('D')),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.20,
                color: Colors.deepPurple.shade300,
                child: const Center(child: Text('E')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
