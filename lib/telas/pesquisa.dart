import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/template.dart';
import '../controllers/doce_controller.dart';

class PesquisaScreen extends StatefulWidget {
  const PesquisaScreen({super.key});

  @override
  State<PesquisaScreen> createState() => _PesquisaScreenState();
}

class _PesquisaScreenState extends State<PesquisaScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    context.read<DoceController>().limparPesquisa();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DoceController>();

    return Scaffold(
      backgroundColor: const Color(0xFFE6CCFF),
      appBar: const CustomAppBar(titulo: 'Pesquisar'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (texto) {
                  context.read<DoceController>().pesquisar(texto);
                },
                decoration: InputDecoration(
                  hintText: "Buscar doces",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF7B1FA2),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: controller.doceFiltrados.length,
                itemBuilder: (context, index) {
                  final doce = controller.doceFiltrados[index];
                  return DoceCard(doce: doce, mostrarFavorito: false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}