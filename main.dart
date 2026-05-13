void main() {

  List<Map<String, dynamic>> alunos = [
    {"id": 98523488, "nome": "João da Silva", "telefone": null},
    {"id": 98523489, "nome": "Lucas Evangelista", "telefone": '11996541236'},
    {"id": 98523490, "nome": "Maria Teodoro", "telefone": '11944551236'},
    {"id": 98523491, "nome": "Isabel Santos", "telefone": null},
  ];

  // Muda a lista de map p/ lista de objetos
  List<Aluno> listaDeObjetos = alunos.map((map) => Aluno.fromMap(map)).toList();

  // imprimir o nome aluno com atributo classe
  print("--- Lista de Alunos ---");
  for (var aluno in listaDeObjetos) {
    print("Nome: ${aluno.nome}"); 
  }
}


class Aluno {
  final int id;
  final String nome;
  final String? telefone; 

  Aluno({
    required this.id,
    required this.nome,
    this.telefone,
  });

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'],
      nome: map['nome'],
      telefone: map['telefone'],
    );
  }
}
