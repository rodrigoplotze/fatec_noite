// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/login_controller.dart';
import '../controller/tarefa_controller.dart';
import '../model/tarefa.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  var txtTitulo = TextEditingController();
  var txtDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              LoginController().logout();
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),

      // BODY
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        //
        // LISTAR as tarefas
        //
        child: StreamBuilder<QuerySnapshot>(
          //fluxo de dados
          stream: TarefaController().listar().snapshots(),
          //exibição dos dados
          builder: (context, snapshot) {
            //verificar a conectividade
            switch (snapshot.connectionState) {
              //sem conexão
              case ConnectionState.none:
                return Center(
                  child: Text("Falha na conexão."),
                );

              //conexão lenta
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );

              //dados recuperados com sucesso
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  //exibir a lista de tarefas
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {

                      //ID do documento
                      String id = dados.docs[index].id;

                      //DADOS armazenados no documento
                      dynamic item = dados.docs[index].data();

                      return Card(
                        child: ListTile(
                          title: Text(item['titulo']),
                          subtitle: Text(item['descricao']),
                          //
                          // Atualizar e Excluir Tarefas
                          //
                          trailing: SizedBox(
                            width: 80,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {

                                    txtTitulo.text = item['titulo'];
                                    txtDescricao.text = item['descricao'];
                                    salvarTarefa(context,docId: id);

                                  },
                                  icon: Icon(Icons.edit_rounded),
                                ),
                                IconButton(
                                  onPressed: () {

                                    TarefaController().excluir(context, id);

                                  },
                                  icon: Icon(Icons.delete_rounded),
                                ),
                              ],
                            ),
                          ),
                          onTap: (){},
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("Nenhuma tarefa encontrada."),
                  );
                }
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          salvarTarefa(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //
  // ADICIONAR TAREFA
  //
  void salvarTarefa(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text((docId == null) ? "Adicionar Tarefa" : "Editar Tarefa"),
          content: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: txtTitulo,
                  decoration: InputDecoration(
                    labelText: 'Título',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtDescricao,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          actions: [
            TextButton(
              child: Text("fechar"),
              onPressed: () {
                txtTitulo.clear();
                txtDescricao.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("salvar"),
              onPressed: () {
                //criação do objeto
                var t = Tarefa(
                  LoginController().idUsuario(),
                  txtTitulo.text,
                  txtDescricao.text,
                );

                if (docId == null){
                  TarefaController().adicionar(context, t);
                }else{
                  TarefaController().atualizar(context, docId, t);
                }

                txtTitulo.clear();
                txtDescricao.clear();
              },
            ),
          ],
        );
      },
    );
  }
}
