import 'package:flutter/material.dart';
import '../models/doce.dart'; 

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  const CustomAppBar({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF4A0072),
      automaticallyImplyLeading: false,
      title: Text(
        titulo,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: Color(0xFFF3E5F5),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class DoceCard extends StatelessWidget {
  final Doce doce;
  final VoidCallback? onFavoritoPressed;
  final bool mostrarFavorito;

  const DoceCard({
    super.key,
    required this.doce,
    this.onFavoritoPressed,
    this.mostrarFavorito = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF3E5F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      child: Container(
        constraints: const BoxConstraints(minHeight: 100),
        child: ListTile(
          leading: SizedBox(
            width: 90,
            height: 140,
            child: Image.asset(
              doce.imagem,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            doce.nome,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF880E4F),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doce.preco,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4A148C),
                ),
              ),
              Text(
                doce.descricao,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2A003F),
                ),
              ),
            ],
          ),
          trailing: mostrarFavorito
              ? IconButton(
                  icon: Icon(
                    doce.favorito ? Icons.favorite : Icons.favorite_border,
                    color: doce.favorito ? Colors.red : Colors.grey,
                  ),
                  onPressed: onFavoritoPressed,
                )
              : null,
        ),
      ),
    );
  }
}