import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/template.dart';
import '../controllers/doce_controller.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DoceController>();
    final favoritos = controller.favoritos;

    return Scaffold(
      backgroundColor: const Color(0xFFE6CCFF),
      appBar: const CustomAppBar(titulo: 'Favoritos'),
      body: favoritos.isEmpty
          ? const Center(
              child: Text(
                'Você ainda não tem favoritos',
                style: TextStyle(color: Color(0xFF4A0072), fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final doce = favoritos[index];
                return DoceCard(doce: doce, mostrarFavorito: false);
              },
            ),
    );
  }
}