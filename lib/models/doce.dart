class Doce {
  final int id;
  final String nome;
  final double preco;
  final String? imagem;
  final String descricao;
  bool favorito;

  Doce({
    required this.id,
    required this.nome,
    required this.preco,
    required this.imagem,
    required this.descricao,
    this.favorito = false,
  });

  String get precoFormatado =>
      'R\$ ${preco.toStringAsFixed(2).replaceAll('.', ',')}';

  factory Doce.fromJson(Map<String, dynamic> json) {
    return Doce(
      id: json['id'],
      nome: json['nome'],
      preco: double.parse(json['preco'].toString()),
      imagem: json['imagem'],
      descricao: json['descricao'] ?? '',
    );
  }
}