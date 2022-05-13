import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'widgets/mensagem.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Café Store'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Email', txtEmail, Icons.email),
            const SizedBox(height: 20),
            campoTexto('Senha', txtSenha, Icons.lock, senha: true),
            const SizedBox(height: 40),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                minimumSize: const Size(200, 45),
                backgroundColor: Colors.brown,
              ),
              child: const Text('entrar'),
              onPressed: () {
                login(txtEmail.text, txtSenha.text);
              },
            ),
            const SizedBox(height: 50),
            TextButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.brown,
              ),
              child: const Text('Criar conta'),
              onPressed: () {
                Navigator.pushNamed(context, 'criar_conta');
              },
            ),
          ],
        ),
      ),
    );
  }

  //
  // CAMPO DE TEXTO
  //
  campoTexto(texto, controller, icone, {senha}) {
    return TextField(
      controller: controller,
      obscureText: senha != null ? true : false,
      style: const TextStyle(
        color: Colors.brown,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icone, color: Colors.brown),
        prefixIconColor: Colors.brown,
        labelText: texto,
        labelStyle: const TextStyle(color: Colors.brown),
        border: const OutlineInputBorder(),
        focusColor: Colors.brown,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.brown,
            width: 0.0,
          ),
        ),
      ),
    );
  }

  //
  // LOGIN com Firebase Auth
  //
  void login(email, senha) {
    FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: senha)
    .then((res){
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushReplacementNamed(context, 'principal');
    }).catchError((e){
      switch(e.code){
        case 'invalid-email':
          erro(context,'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context,'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context,'Senha incorreta.');
          break;
        default:
          erro(context,e.code.toString());
      }
   });
   }
}