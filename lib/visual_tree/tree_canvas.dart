import 'package:flutter/material.dart';

import 'tree_layout_service.dart';

import '../models/tree_node.dart';

class TreeCanvas extends StatelessWidget {

  final TreeNode? root;

  const TreeCanvas({
    super.key,
    required this.root,
  });

  @override
  Widget build(BuildContext context) {

    final layout =
        TreeLayoutService();

    final visualRoot =
        layout.buildVisualTree(root);

    return InteractiveViewer(

      boundaryMargin:
          const EdgeInsets.all(500),

      minScale: 0.2,
      maxScale: 3,

      child: SizedBox(
        width: 1200,
        height: 800,

        child: CustomPaint(
          painter:
              _TreePainter(visualRoot),
        ),
      ),
    );
  }
}

class _TreePainter
    extends CustomPainter {

  final dynamic root;

  _TreePainter(this.root);

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {

    if (root == null) return;

    final linePaint = Paint()

      ..color = const Color(
        0xFF90A4AE,
      )

      ..strokeWidth = 3

      ..strokeCap = StrokeCap.round

      ..isAntiAlias = true;

    _drawNode(
      canvas,
      root,
      linePaint,
    );
  }

  void _drawNode(
    Canvas canvas,
    dynamic node,
    Paint linePaint,
  ) {

    // LÍNEA IZQUIERDA
    if (node.left != null) {

      canvas.drawLine(

        Offset(node.x, node.y),

        Offset(
          node.left.x,
          node.left.y,
        ),

        linePaint,
      );

      _drawNode(
        canvas,
        node.left,
        linePaint,
      );
    }

    // LÍNEA DERECHA
    if (node.right != null) {

      canvas.drawLine(

        Offset(node.x, node.y),

        Offset(
          node.right.x,
          node.right.y,
        ),

        linePaint,
      );

      _drawNode(
        canvas,
        node.right,
        linePaint,
      );
    }

    // POSICIÓN DEL NODO
    final Offset nodePosition =
        Offset(node.x, node.y);

    const double nodeRadius = 30;

    final Rect rect =
        Rect.fromCircle(
      center: nodePosition,
      radius: nodeRadius,
    );

    // SOMBRA
    final Paint shadowPaint =
        Paint()

          ..color = Colors.black
              .withOpacity(0.18)

          ..maskFilter =
              const MaskFilter.blur(
            BlurStyle.normal,
            10,
          )

          ..isAntiAlias = true;

    canvas.drawCircle(

      Offset(
        node.x,
        node.y + 5,
      ),

      nodeRadius,

      shadowPaint,
    );

    // GRADIENTE DEL NODO
    final Paint nodePaint =
        Paint()

          ..shader =
              const LinearGradient(

            colors: [

              Color(0xFF4A90E2),
              Color(0xFF357ABD),
            ],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

          ).createShader(rect)

          ..isAntiAlias = true;

    // NODO
    canvas.drawCircle(
      nodePosition,
      nodeRadius,
      nodePaint,
    );

    // BORDE
    final Paint borderPaint =
        Paint()

          ..color = Colors.white

          ..style =
              PaintingStyle.stroke

          ..strokeWidth = 3

          ..isAntiAlias = true;

    canvas.drawCircle(
      nodePosition,
      nodeRadius,
      borderPaint,
    );

    // TEXTO
    final textPainter =
        TextPainter(

      text: TextSpan(

        text: node.value,

        style: const TextStyle(

          color: Colors.white,

          fontSize: 22,

          fontWeight:
              FontWeight.bold,
        ),
      ),

      textDirection:
          TextDirection.ltr,
    );

    textPainter.layout();

    textPainter.paint(

      canvas,

      Offset(
        node.x - 8,
        node.y - 14,
      ),
    );
  }

  @override
  bool shouldRepaint(
    CustomPainter oldDelegate,
  ) {

    return true;
  }
}