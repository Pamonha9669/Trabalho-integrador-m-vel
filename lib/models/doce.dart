class Doce {
  final String nome;
  final String preco;
  final String imagem;
  final String descricao;
  bool favorito;

  Doce({
    required this.nome,
    required this.preco,
    required this.imagem,
    required this.descricao,
    this.favorito = false,
  });
}