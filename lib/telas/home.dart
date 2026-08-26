import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/template.dart';
import '../controllers/doce_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DoceController>();

    return Scaffold(
      backgroundColor: const Color(0xFFE6CCFF),
      appBar: const CustomAppBar(titulo: 'Rare Candy'),
      body: ListView.builder(
        itemCount: controller.doces.length,
        itemBuilder: (context, index) {
          final doce = controller.doces[index];
          return DoceCard(
            doce: doce,
            onFavoritoPressed: () {
              context.read<DoceController>().toggleFavorito(doce);
            },
          );
        },
      ),
    );
  }
}