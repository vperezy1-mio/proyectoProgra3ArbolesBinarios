import 'package:flutter/material.dart';

import '../widgets/menu_card.dart';

import '../core/routes/app_routes.dart';

import 'tree_builder_screen.dart';
import 'traversal_screen.dart';
import 'reconstruction_screen.dart';

import '../widgets/versionWidget.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Árboles Binarios',
        ),
      ),

      body: Center(

        child: SingleChildScrollView(

          child: Padding(

            padding:
                const EdgeInsets.all(20),

            child: ConstrainedBox(

              constraints:
                  const BoxConstraints(
                maxWidth: 700,
              ),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const SizedBox(height: 20),

                  const Text(
                    'Árboles Binarios',

                    style: TextStyle(
                      fontSize: 36,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(

                    'Visualización y análisis '
                    'interactivo de árboles '
                    'binarios.',

                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // CONSTRUCCIÓN
                  MenuCard(

                    title:
                        'Construcción de Árbol',

                    subtitle:
                        'Crear y visualizar '
                        'árboles binarios '
                        'manualmente.',

                    icon: Icons.account_tree,

                    onTap: () {

                      Navigator.push(

                        context,

                        AppRoutes.createRoute(
                          const TreeBuilderScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // RECORRIDOS
                  MenuCard(

                    title: 'Recorridos',

                    subtitle:
                        'Ejecutar recorridos '
                        'preorden, inorden '
                        'y postorden.',

                    icon: Icons.route,

                    onTap: () {

                      Navigator.push(

                        context,

                        AppRoutes.createRoute(
                          const TraversalScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // RECONSTRUCCIÓN
                  MenuCard(

                    title:
                        'Reconstrucción',

                    subtitle:
                        'Reconstruir árboles '
                        'a partir de '
                        'recorridos.',

                    icon:
                        Icons.auto_graph,

                    onTap: () {

                      Navigator.push(

                        context,

                        AppRoutes.createRoute(
                          const ReconstructionScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 30),
                  const Center(
                    child: VersionWidget(),
                  ), //version
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}