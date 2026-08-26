import 'package:flutter/material.dart';
import '../models/doce.dart';

class DoceController extends ChangeNotifier {
  final List<Doce> _doces = [
    Doce(
      nome: 'Bolo de Chocolate',
      preco: 'R\$ 25,00',
      imagem: 'assets/imagens/bolo_chocolate.png',
      descricao: 'Bolo fofinho com cobertura de chocolate cremoso',
    ),
    Doce(
      nome: 'Cupcake de Baunilha',
      preco: 'R\$ 12,00',
      imagem: 'assets/imagens/cupcake.png',
      descricao: 'Cupcake leve com cobertura de chantilly',
    ),
    Doce(
      nome: 'Brigadeiro Gourmet',
      preco: 'R\$ 5,00',
      imagem: 'assets/imagens/brigadeiro.png',
      descricao: 'Brigadeiro cremoso com chocolate premium',
    ),
    Doce(
      nome: 'Torta de Morango',
      preco: 'R\$ 30,00',
      imagem: 'assets/imagens/torta_morango.png',
      descricao: 'Torta fresca com creme e morangos naturais',
    ),
    Doce(
      nome: 'Donut',
      preco: 'R\$ 10,00',
      imagem: 'assets/imagens/donut.png',
      descricao: 'Rosquinha macia com cobertura rosa',
    ),
    Doce(
      nome: 'Brownie',
      preco: 'R\$ 15,00',
      imagem: 'assets/imagens/brownie.png',
      descricao: 'Brownie denso e chocolatudo por dentro',
    ),
  ];

  String _termoPesquisa = '';

  // Getter: lista completa de doces
  List<Doce> get doces => _doces;

  // Getter: só os favoritados
  List<Doce> get favoritos => _doces.where((d) => d.favorito).toList();

  // Getter: lista filtrada pela pesquisa atual
  List<Doce> get doceFiltrados {
    if (_termoPesquisa.isEmpty) return _doces;
    return _doces
        .where((d) => d.nome.toLowerCase().contains(_termoPesquisa.toLowerCase()))
        .toList();
  }

  // Favoritar / desfavoritar
  void toggleFavorito(Doce doce) {
    doce.favorito = !doce.favorito;
    notifyListeners();
  }

  // Atualiza o termo de pesquisa
  void pesquisar(String termo) {
    _termoPesquisa = termo;
    notifyListeners();
  }
}