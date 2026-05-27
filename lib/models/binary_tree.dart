import 'tree_node.dart';

class BinaryTree {
  TreeNode? root;

  // CREAR RAÍZ
  void insertRoot(String value) {
    root = TreeNode(value);
  }

  // BUSCAR NODO
  TreeNode? findNode(
    TreeNode? node,
    String value,
  ) {
    if (node == null) {
      return null;
    }

    if (node.value == value) {
      return node;
    }

    TreeNode? leftSearch = findNode(node.left, value);

    if (leftSearch != null) {
      return leftSearch;
    }

    return findNode(
      node.right,
      value,
    );
  }

  // VALIDAR DUPLICADOS
  bool containsValue(
    TreeNode? node,
    String value,
  ) {
    if (node == null) {
      return false;
    }

    if (node.value == value) {
      return true;
    }

    return containsValue(
          node.left,
          value,
        ) ||
        containsValue(
          node.right,
          value,
        );
  }

  // PROFUNDIDAD
  int getDepth(TreeNode? node) {
    if (node == null) {
      return 0;
    }

    int leftDepth = getDepth(node.left);

    int rightDepth = getDepth(node.right);

    return 1 + (leftDepth > rightDepth ? leftDepth : rightDepth);
  }

  // INSERTAR IZQUIERDA
  String insertLeft(
    String parentValue,
    String childValue,
  ) {
    if (childValue.trim().isEmpty) {
      return 'empty';
    }

    if (containsValue(
      root,
      childValue,
    )) {
      return 'duplicate';
    }

    if (getDepth(root) >= 5) {
      return 'depth';
    }

    TreeNode? parent = findNode(root, parentValue);

    if (parent == null) {
      return 'parent';
    }

    if (parent.left != null) {
      return 'occupied';
    }

    parent.left = TreeNode(childValue);

    return 'success';
  }

  // INSERTAR DERECHA
  String insertRight(
    String parentValue,
    String childValue,
  ) {
    if (childValue.trim().isEmpty) {
      return 'empty';
    }

    if (containsValue(
      root,
      childValue,
    )) {
      return 'duplicate';
    }

    if (getDepth(root) >= 5) {
      return 'depth';
    }

    TreeNode? parent = findNode(root, parentValue);

    if (parent == null) {
      return 'parent';
    }

    if (parent.right != null) {
      return 'occupied';
    }

    parent.right = TreeNode(childValue);

    return 'success';
  }

  // LIMPIAR ÁRBOL
  void clearTree() {
    root = null;
  }
 // LIMPIAR TODOS LOS ARBOLES
  void clear() {
    root = null;
  }
}
