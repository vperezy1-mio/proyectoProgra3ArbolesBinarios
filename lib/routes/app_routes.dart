import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/tree_builder_screen.dart';
import '../screens/traversal_screen.dart';
import '../screens/reconstruction_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomeScreen(),

    '/builder': (context) => const TreeBuilderScreen(),

    '/traversal': (context) => const TraversalScreen(),

    '/reconstruction': (context) => const ReconstructionScreen(),
  };
}