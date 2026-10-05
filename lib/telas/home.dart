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
      body: controller.carregando
          ? const Center(child: CircularProgressIndicator())
          : controller.erro != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.erro!),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<DoceController>().carregarDoces(),
                        child: const Text('Tentar de novo'),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () =>
                      context.read<DoceController>().carregarDoces(),
                  child: ListView.builder(
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
                ),
    );
  }
}