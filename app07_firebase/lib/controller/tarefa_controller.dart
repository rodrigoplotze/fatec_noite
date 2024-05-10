import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/tarefa.dart';
import '../view/util.dart';

class TarefaController {

  //Adicionar uma tarefa no Firestore
  void adicionar(context, Tarefa t) {

    FirebaseFirestore.instance
        .collection('tarefas')
        .add(t.toJson())
        .then((resultado) => sucesso(context, 'Tarefa adicionada com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível adicionar a tarefa'))
        .whenComplete(() => Navigator.pop(context));

  }
}
