import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../controllers/tree_controller.dart';

import '../widgets/tree_widget.dart';

class ReconstructionScreen
    extends StatefulWidget {

  const ReconstructionScreen({
    super.key,
  });

  @override
  State<ReconstructionScreen>
      createState() =>
          _ReconstructionScreenState();
}

class _ReconstructionScreenState
    extends State<ReconstructionScreen> {

  final TextEditingController
      preorderController =
          TextEditingController();

  final TextEditingController
      inorderController =
          TextEditingController();

  @override
  Widget build(BuildContext context) {

    final controller =
        Provider.of<TreeController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reconstrucción',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [

              // PREORDEN
              TextField(
                controller:
                    preorderController,

                decoration:
                    const InputDecoration(
                  labelText:
                      'Preorden',

                  hintText:
                      'A B D E C F',

                  border:
                      OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // INORDEN
              TextField(
                controller:
                    inorderController,

                decoration:
                    const InputDecoration(
                  labelText:
                      'Inorden',

                  hintText:
                      'D B E A F C',

                  border:
                      OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {

                  List<String> preorder =
                    preorderController.text
                        .trim()
                        .split(RegExp(r'\s+'));

                  List<String> inorder =
                      inorderController.text
                          .trim()
                          .split(RegExp(r'\s+'));

                  if (preorder.length != inorder.length) {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(
                        content: Text(
                          'Los recorridos no coinciden',
                        ),
                      ),
                    );

                    return;
                  }

                  controller.reconstructTree(
                    preorder,
                    inorder,
                  );

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(

                    const SnackBar(
                      content: Text(
                        'Árbol reconstruido',
                      ),
                    ),
                  );
                },

                child: const Text(
                  'Reconstruir Árbol',
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                'Resultado',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              TreeWidget(
                root:
                    controller.reconstructedTree.root,
              ),
            ],
          ),
        ),
      ),
    );
  }
}