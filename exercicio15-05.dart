




class Operacao {
  final Pedido pedido;
  final Cliente cliente;  
  final Pagamento pagamento;
  final Produto produto;
Operacao({
  required this.pedido,
  required this.cliente,
  required this.pagamento,
  required this.produto,  
});

Operacao.fromMap(Map<String, dynamic> map)
      :pedido = Pedido(
        idPedido: map['id_pedido'],
        dataCriacao: DateTime.parse(map['data_criacao']),
        status: map['status'],
      ),
      cliente = Cliente(
        idCliente: map['cliente']['id_cliente'],
        nome: map['cliente']['nome'],
        email: map['cliente']['email'],
      ),
      pagamento = Pagamento(
        metodo: map['pagamento']['metodo'],
        parcelas: map['pagamento']['parcelas'],
        confirmado: map['pagamento']['confirmado'],
      ),
      produto = Produto(
        idProduto: map['itens'][0]['id_produto'],
        nome: map['itens'][0]['nome'],
        precoUnitario: map['itens'][0]['preco_unitario'],
        quantidade: map['itens'][0]['quantidade'],
      );
}

class Pedido {
  final String idPedido;
  final DateTime dataCriacao;
  final String status;

Pedido({
  required this.idPedido,
  required this.dataCriacao,
  required this.status,
});

}
class Cliente {
  final String idCliente;
  final String nome;
  final String email;

Cliente({
  required this.idCliente,
  required this.nome,
  required this.email,  
});
}
class Pagamento {
  final String metodo;
  final int parcelas;
  final bool confirmado;

Pagamento({
  required this.metodo,
  required this.parcelas,
  required this.confirmado,
});
}
class Produto {
  final String idProduto;
  final String nome;
  final double precoUnitario;
  final int quantidade;

Produto({
  required this.idProduto,  
  required this.nome,
  required this.precoUnitario,    
  required this.quantidade,   
});
}


void main() {

final listaPedidos = [
  {
    "id_pedido": "REQ-9872",
    "data_criacao": "2026-05-14T10:00:00Z",
    "status": "processando",
    "cliente": {
      "id_cliente": "USR-441",
      "nome": "Ana Silva",
      "email": "ana.silva@email.com",
    },
    "pagamento": {
      "metodo": "cartao_credito",
      "parcelas": 3,
      "confirmado": true,
    },
    "itens": [
      {
        "id_produto": "PROD-001",
        "nome": "Teclado Mecânico RGB",
        "preco_unitario": 349.90,
        "quantidade": 1,
      },

      {
        "id_produto": "PROD-012",
        "nome": "Mouse Pad Extendido",
        "preco_unitario": 89.90,
        "quantidade": 2,
      },
    ],
  },
  {
    "id_pedido": "REQ-9873",
    "data_criacao": "2026-05-14T10:15:00Z",
    "status": "entregue",
    "cliente": {
      "id_cliente": "USR-102",
      "nome": "Carlos Souza",
      "email": "carlos.s@email.com",
    },
    "pagamento": {"metodo": "pix", "parcelas": 1, "confirmado": true},
    "itens": [
      {
        "id_produto": "PROD-055",
        "nome": "Fone de Ouvido Bluetooth",
        "preco_unitario": 199.00,
        "quantidade": 1,
      },
    ],
  },
];

List<Operacao> pedidosObjetos = listaPedidos
      .map((mapa) => Operacao.fromMap(mapa))
      .toList();
print("--- Lista de Pedidos ---");
for (var operacao in pedidosObjetos) {
  print("ID Pedido: ${operacao.pedido.idPedido} - Cliente: ${operacao.cliente.nome} - Produto: ${operacao.produto.nome} - Status: ${operacao.pedido.status}");

}
}
