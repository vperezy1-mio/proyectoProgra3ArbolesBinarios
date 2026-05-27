import '../models/tree_node.dart';

class ReconstructionService {

  TreeNode? buildTree(
    List<String> preorder,
    List<String> inorder,
  ) {

    if (preorder.isEmpty ||
        inorder.isEmpty) {
      return null;
    }

    // RAÍZ
    String rootValue = preorder[0];

    TreeNode root = TreeNode(rootValue);

    // POSICIÓN EN INORDEN
    int rootIndex =
        inorder.indexOf(rootValue);

    // SUBÁRBOL IZQUIERDO
    List<String> leftInorder =
        inorder.sublist(0, rootIndex);

    // SUBÁRBOL DERECHO
    List<String> rightInorder =
        inorder.sublist(rootIndex + 1);

    // PREORDEN IZQUIERDO
    List<String> leftPreorder =
        preorder.sublist(
      1,
      1 + leftInorder.length,
    );

    // PREORDEN DERECHO
    List<String> rightPreorder =
        preorder.sublist(
      1 + leftInorder.length,
    );

    // RECURSIVIDAD
    root.left = buildTree(
      leftPreorder,
      leftInorder,
    );

    root.right = buildTree(
      rightPreorder,
      rightInorder,
    );

    return root;
  }
}