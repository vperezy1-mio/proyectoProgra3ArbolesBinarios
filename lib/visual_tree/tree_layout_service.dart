import '../models/tree_node.dart';

import 'tree_node_data.dart';

class TreeLayoutService {

  double startX = 400;

  double horizontalSpacing = 120;

  double verticalSpacing = 120;

  TreeNodeData? buildVisualTree(
    TreeNode? root,
  ) {

    return _buildNode(
      root,
      startX,
      50,
      horizontalSpacing,
    );
  }

  TreeNodeData? _buildNode(
    TreeNode? node,
    double x,
    double y,
    double spacing,
  ) {

    if (node == null) {
      return null;
    }

    TreeNodeData visualNode =
        TreeNodeData(
      value: node.value,
      x: x,
      y: y,
    );

    visualNode.left = _buildNode(
      node.left,
      x - spacing,
      y + verticalSpacing,
      spacing / 1.8,
    );

    visualNode.right = _buildNode(
      node.right,
      x + spacing,
      y + verticalSpacing,
      spacing / 1.8,
    );

    return visualNode;
  }
}