import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/tree_controller.dart';
import '../visual_tree/tree_canvas.dart';
import '../core/constants/app_messages.dart';

class TreeBuilderScreen extends StatefulWidget {
  const TreeBuilderScreen({super.key});

  @override
  State<TreeBuilderScreen> createState() => _TreeBuilderScreenState();
}

class _TreeBuilderScreenState extends State<TreeBuilderScreen> {
  final TextEditingController parentController = TextEditingController();

  final TextEditingController childController = TextEditingController();

  final TextEditingController rootController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TreeController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Construcción del Árbol'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // CREAR RAÍZ
              TextField(
                controller: rootController,
                decoration: const InputDecoration(
                  labelText: 'Valor raíz',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  String message = controller.createRoot(
                    rootController.text,
                  );

                  showResult(message);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Raíz creada'),
                    ),
                  );
                },
                child: const Text('Crear Raíz'),
              ),

              const SizedBox(height: 30),

              // PADRE
              TextField(
                controller: parentController,
                decoration: const InputDecoration(
                  labelText: 'Nodo padre',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // HIJO
              TextField(
                controller: childController,
                decoration: const InputDecoration(
                  labelText: 'Nuevo nodo',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // BOTONES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String message = controller.insertLeft(
                        parentController.text,
                        childController.text,
                      );

                      showResult(message);
                    },
                    child: const Text(
                      'Insertar Izquierda',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String message = controller.insertRight(
                        parentController.text,
                        childController.text,
                      );

                      showResult(message);
                    },
                    child: const Text(
                      'Insertar Derecha',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              const Text(
                'Vista actual del árbol',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  controller.clearTree();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Árbol limpiado',
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Limpiar Árbol',
                ),
              ),

              const SizedBox(height: 20),

              TreeCanvas(
                root: controller.manualTree.root,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showResult(String message) {
    bool success = message == AppMessages.success;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: success ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: Row(
          children: [
            Icon(
              success ? Icons.check_circle : Icons.error,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(message),
            ),
          ],
        ),
      ),
    );
  }
}
