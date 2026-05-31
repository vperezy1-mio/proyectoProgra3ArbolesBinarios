import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter/services.dart';

import '../controllers/tree_controller.dart';

class TraversalScreen extends StatefulWidget {

  const TraversalScreen({
    super.key,
  });

  @override
  State<TraversalScreen> createState() =>
      _TraversalScreenState();
}

class _TraversalScreenState
    extends State<TraversalScreen> {

  String traversalResult = '';

  String selectedTraversal = '';

  @override
  Widget build(BuildContext context) {

    final controller =
        Provider.of<TreeController>(
      context,
    );

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Recorridos',
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
                maxWidth: 500,
              ),

              child: Column(

                children: [

                  const Icon(
                    Icons.route,
                    size: 90,
                    color: Colors.green,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Seleccione un recorrido',

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // PREORDEN
                  buildTraversalButton(

                    title: 'Preorden',

                    onPressed: () {

                      setState(() {

                        selectedTraversal =
                            'Preorden';

                        traversalResult =
                            controller
                                .getPreorder()
                                .join(' ');
                        Clipboard.setData(ClipboardData(text: traversalResult));
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // INORDEN
                  buildTraversalButton(

                    title: 'Inorden',

                    onPressed: () {

                      setState(() {

                        selectedTraversal =
                            'Inorden';

                        traversalResult =
                            controller
                                .getInorder()
                                .join(' ');
                        Clipboard.setData(ClipboardData(text: traversalResult));
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // POSTORDEN
                  buildTraversalButton(

                    title: 'Postorden',

                    onPressed: () {

                      setState(() {

                        selectedTraversal =
                            'Postorden';

                        traversalResult =
                            controller
                                .getPostorder()
                                .join(' ');
                        Clipboard.setData(ClipboardData(text: traversalResult));
                      });
                    },
                  ),

                  const SizedBox(height: 50),

                  if (traversalResult
                      .isNotEmpty)

                    Card(

                      elevation: 4,

                      child: Padding(
                        padding:
                            const EdgeInsets
                                .all(20),

                        child: Column(

                          children: [

                            Text(
                              selectedTraversal,

                              style:
                                  const TextStyle(
                                fontSize: 22,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            Text(
                              traversalResult,

                              textAlign:
                                  TextAlign
                                      .center,

                              style:
                                  const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTraversalButton({

    required String title,

    required VoidCallback onPressed,
  }) {

    return SizedBox(

      width: double.infinity,

      child: ElevatedButton(

        onPressed: onPressed,

        child: Padding(
          padding:
              const EdgeInsets.all(15),

          child: Text(
            title,

            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}