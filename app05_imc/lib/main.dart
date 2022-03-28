import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC',
      home: TelaPrincipal(),
    ),
  );
}

//
// STATEFUL WIDGET
// stf + TAB
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //Declaração dos atributos que serão usados para
  //armazenar os dados informados pelo usuário
  var txtPeso = TextEditingController();
  var txtAltura = TextEditingController();

  //Declaração de um atributo que identifica unicamente
  //o formulário
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade900,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),

          //FORMULÁRIO PARA VALIDAÇÃO
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.people_alt,
                    color: Colors.indigo.shade900,
                    size: 100,
                  ),
                  const SizedBox(height: 30),
                  campoTexto('Peso', txtPeso),
                  const SizedBox(height: 20),
                  campoTexto('Altura', txtAltura),
                  const SizedBox(height: 40),
                  botao('calcular'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  // CAMPO DE TEXTO
  //
  campoTexto(rotulo, variavel) {
    return TextFormField(
      //variável associada
      controller: variavel,
      maxLength: 15,
      style: TextStyle(
        fontSize: 32,
        color: Colors.grey.shade900,
      ),

      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          fontSize: 24,
          color: Colors.grey.shade600,
        ),
        hintText: 'Informe o valor',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        
      ),

      //VALIDAÇÃO DOS DADOS
      validator: (value) {
        value = value!.replaceFirst(',', '.');
        if (double.tryParse(value) == null) {
          return 'Entre com um valor numérico';
        } else {
          return null;
        }
      },
    );
  }

  //
  // BOTÃO
  //
  botao(rotulo) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        //evento que será disparado quando o usuário
        //acionar o botão
        onPressed: () {
          //Validar o formulário
          if (formKey.currentState!.validate()) {

            //O método setState é usado para acessar
            //os dados fornecidos pelo usuário
            setState(() {
              double peso = double.parse(txtPeso.text.replaceFirst(',', '.'));
              double altura =
                  double.parse(txtAltura.text.replaceFirst(',', '.'));
              double imc = peso / pow(altura, 2);
              caixaDialogo(
                'O valor do IMC é ${imc.toStringAsFixed(2)}'
                    .replaceFirst('.', ','),
              );
            });

          }
        },
        child: Text(
          rotulo,
          style: const TextStyle(fontSize: 24),
        ),

        style: ElevatedButton.styleFrom(
          primary: Colors.indigo.shade600,
        ),
      ),
    );
  }

  //
  // CAIXA DE DIÁLOGO
  //
  caixaDialogo(msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Calculadora'),
            content: Text(msg),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    setState(() {
                      txtPeso.clear();
                      txtAltura.clear();
                    });
                  },
                  child: const Text('fechar')),
            ],
          );
        });
  }
}
