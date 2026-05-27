import '../models/tree_node.dart';

class TraversalService {

  // PREORDEN
  List<String> preorder(TreeNode? node) {
    List<String> result = [];

    if (node != null) {
      result.add(node.value);

      result.addAll(preorder(node.left));

      result.addAll(preorder(node.right));
    }

    return result;
  }

  // INORDEN
  List<String> inorder(TreeNode? node) {
    List<String> result = [];

    if (node != null) {
      result.addAll(inorder(node.left));

      result.add(node.value);

      result.addAll(inorder(node.right));
    }

    return result;
  }

  // POSTORDEN
  List<String> postorder(TreeNode? node) {
    List<String> result = [];

    if (node != null) {
      result.addAll(postorder(node.left));

      result.addAll(postorder(node.right));

      result.add(node.value);
    }

    return result;
  }
}