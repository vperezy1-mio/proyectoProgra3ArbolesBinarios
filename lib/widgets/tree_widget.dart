import 'package:flutter/material.dart';

import '../models/tree_node.dart';

import '../visual_tree/tree_canvas.dart';

class TreeWidget extends StatelessWidget {

  final TreeNode? root;

  const TreeWidget({
    super.key,
    required this.root,
  });

  @override
  Widget build(BuildContext context) {

    if (root == null) {

      return Container(

        width: double.infinity,

        padding:
            const EdgeInsets.all(40),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
              BorderRadius.circular(20),
        ),

        child: const Column(

          children: [

            Icon(
              Icons.account_tree_outlined,
              size: 80,
              color: Colors.grey,
            ),

            SizedBox(height: 20),

            Text(

              'No hay árbol generado',

              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight:
                    FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Container(

      height: 600,

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(

            color:
                Colors.black.withOpacity(
              0.05,
            ),

            blurRadius: 10,

            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      ),

      child: ClipRRect(

        borderRadius:
            BorderRadius.circular(20),

        child: TreeCanvas(
          root: root,
        ),
      ),
    );
  }
}