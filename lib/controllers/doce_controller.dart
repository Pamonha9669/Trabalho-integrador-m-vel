import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/doce.dart';

class DoceController extends ChangeNotifier {
    static const String baseUrl = 'https://rare-candy.sao.dom.my.id/api';
  List<Doce> _doces = [];
  final Set<int> _favoritosIds = {};
  String _termoPesquisa = '';

  bool carregando = false;
  String? erro;

  DoceController() {
    carregarDoces();
  }

  List<Doce> get doces => _doces;
  List<Doce> get favoritos => _doces.where((d) => d.favorito).toList();

  List<Doce> get doceFiltrados {
    if (_termoPesquisa.isEmpty) return _doces;
    return _doces
        .where((d) => d.nome.toLowerCase().contains(_termoPesquisa.toLowerCase()))
        .toList();
  }

  Future<void> carregarDoces() async {
    carregando = true;
    erro = null;
    notifyListeners();

      try {
      final response = await http
          .get(Uri.parse('$baseUrl/produtos'))
          .timeout(const Duration(seconds: 10));

      final corpo = response.body;
      debugPrint('STATUS: ${response.statusCode}');
      debugPrint('CORPO: ${corpo.substring(0, corpo.length > 300 ? 300 : corpo.length)}');

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List dados = decoded is Map ? decoded['data'] : decoded;
        _doces = dados.map((j) => Doce.fromJson(j)).toList();
        for (final d in _doces) {
          d.favorito = _favoritosIds.contains(d.id);
        }
      } else {
        erro = 'Erro ${response.statusCode} ao carregar os doces';
      }
    } catch (e) {
      debugPrint('ERRO: $e');
      erro = 'Não foi possível carregar os doces. Verifique a conexão.';
    }

    carregando = false;
    notifyListeners();
  }

  void toggleFavorito(Doce doce) {
    doce.favorito = !doce.favorito;
    doce.favorito ? _favoritosIds.add(doce.id) : _favoritosIds.remove(doce.id);
    notifyListeners();
  }

  void pesquisar(String termo) {
    _termoPesquisa = termo;
    notifyListeners();
  }
}