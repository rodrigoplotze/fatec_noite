class Tarefa {
  
  //campos do documento
  final String uid;
  final String titulo;
  final String descricao;

  Tarefa(this.uid, this.titulo, this.descricao);

  //
  // Transforma um OBJETO em JSON
  //
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'titulo': titulo,
      'descricao': descricao,
    };
  }

  //
  // Transforma um JSON em OBJETO
  //
  factory Tarefa.fromJson(Map<String, dynamic> json) {
    return Tarefa(
      json['uid'],
      json['titulo'],
      json['descricao'],
    );
  }
}
