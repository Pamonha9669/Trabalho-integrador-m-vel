import 'package:flutter/material.dart';
import 'home.dart';      
import 'pesquisa.dart';     
import 'favoritos.dart';  

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int paginaAtual = 0;

  final List<Widget> telas = [
    const HomeScreen(),
    const PesquisaScreen(),
   const FavoritosScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[paginaAtual],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        selectedItemColor: const Color(0xFF880E4F),
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            paginaAtual = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Pesquisar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}