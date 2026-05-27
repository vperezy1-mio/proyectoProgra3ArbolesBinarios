import 'package:flutter/material.dart';
import '../models/binary_tree.dart';
import '../services/traversal_service.dart';
import '../services/reconstruction_service.dart';
import '../core/constants/app_messages.dart';

class TreeController extends ChangeNotifier {
  final BinaryTree manualTree = BinaryTree();
  final BinaryTree reconstructedTree = BinaryTree();
  final TraversalService traversalService = TraversalService();

  final ReconstructionService reconstructionService = ReconstructionService();

  bool rootCreated = false;

  // Crear raíz
  String createRoot(String value) {
    if (value.trim().isEmpty) {
      return AppMessages.emptyValue;
    }

    if (rootCreated) {
      return AppMessages.rootAlreadyExists;
    }

    manualTree.insertRoot(value);

    rootCreated = true;

    notifyListeners();

    return AppMessages.success;
  }

  // Insertar izquierda
  String insertLeft(
    String parent,
    String child,
  ) {
    String result = manualTree.insertLeft(
      parent,
      child,
    );

    notifyListeners();

    return mapMessage(
      result,
      true,
    );
  }

  // Insertar derecha
  String insertRight(
    String parent,
    String child,
  ) {
    String result = manualTree.insertRight(
      parent,
      child,
    );

    notifyListeners();

    return mapMessage(
      result,
      false,
    );
  }

  String mapMessage(
    String code,
    bool isLeft,
  ) {
    switch (code) {
      case 'success':
        return AppMessages.success;

      case 'empty':
        return AppMessages.emptyValue;

      case 'duplicate':
        return AppMessages.duplicateNode;

      case 'depth':
        return AppMessages.maxDepth;

      case 'parent':
        return AppMessages.parentNotFound;

      case 'occupied':
        return isLeft ? AppMessages.leftOccupied : AppMessages.rightOccupied;

      default:
        return 'Error desconocido';
    }
  }

  // Recorridos
  List<String> getPreorder() {
    return traversalService.preorder(manualTree.root);
  }

  List<String> getInorder() {
    return traversalService.inorder(manualTree.root);
  }

  List<String> getPostorder() {
    return traversalService.postorder(manualTree.root);
  }

  void reconstructTree(
    List<String> preorder,
    List<String> inorder,
  ) {
    reconstructedTree.root = reconstructionService.buildTree(
      preorder,
      inorder,
    );

    // DEBUG
    print('ÁRBOL RECONSTRUIDO');

    print(getPreorder());

    notifyListeners();
  }

  void clearTree() {
    manualTree.clearTree();

    rootCreated = false;

    notifyListeners();
  }

  void clearTrees() {
    manualTree.clear();

    reconstructedTree.clear();

    notifyListeners();
  }
}
