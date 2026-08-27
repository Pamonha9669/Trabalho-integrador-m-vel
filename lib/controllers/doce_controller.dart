import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';
import '../models/doce.dart';

class DoceController extends ChangeNotifier {
  static const _chaveFavoritos = 'favoritos_nomes';

=======
import '../models/doce.dart';

class DoceController extends ChangeNotifier {
>>>>>>> c6a83e411303b8b7810f5b5c185362ccc40aa63b
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

<<<<<<< HEAD
  DoceController() {
    _carregarFavoritos();
  }

  List<Doce> get doces => _doces;

  List<Doce> get favoritos => _doces.where((d) => d.favorito).toList();

  List<Doce> get doceFiltrados {
    if (_termoPesquisa.isEmpty) return _doces;
    return _doces
        .where((d) =>
            d.nome.toLowerCase().startsWith(_termoPesquisa.toLowerCase()))
        .toList();
  }

  Future<void> toggleFavorito(Doce doce) async {
    doce.favorito = !doce.favorito;
    notifyListeners();
    await _salvarFavoritos();
  }

=======
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
>>>>>>> c6a83e411303b8b7810f5b5c185362ccc40aa63b
  void pesquisar(String termo) {
    _termoPesquisa = termo;
    notifyListeners();
  }
<<<<<<< HEAD
  
   void limparPesquisa() {
    _termoPesquisa = '';
    notifyListeners();
  }

  Future<void> _carregarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    final nomesSalvos = prefs.getStringList(_chaveFavoritos) ?? [];

    for (var doce in _doces) {
      doce.favorito = nomesSalvos.contains(doce.nome);
    }
    notifyListeners();
  }

  Future<void> _salvarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    final nomesFavoritos =
        _doces.where((d) => d.favorito).map((d) => d.nome).toList();
    await prefs.setStringList(_chaveFavoritos, nomesFavoritos);
  }
=======
>>>>>>> c6a83e411303b8b7810f5b5c185362ccc40aa63b
}