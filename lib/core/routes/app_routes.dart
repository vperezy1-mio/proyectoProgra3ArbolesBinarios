import 'package:flutter/material.dart';

class AppRoutes {

  static Route createRoute(
    Widget page,
  ) {

    return PageRouteBuilder(

      transitionDuration:
          const Duration(
        milliseconds: 350,
      ),

      reverseTransitionDuration:
          const Duration(
        milliseconds: 300,
      ),

      pageBuilder: (
        context,
        animation,
        secondaryAnimation,
      ) {

        return page;
      },

      transitionsBuilder: (

        context,
        animation,
        secondaryAnimation,
        child,
      ) {

        final fadeAnimation =
            CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );

        final slideAnimation =
            Tween<Offset>(

          begin: const Offset(
            0.08,
            0,
          ),

          end: Offset.zero,

        ).animate(

          CurvedAnimation(
            parent: animation,
            curve:
                Curves.easeOutCubic,
          ),
        );

        return FadeTransition(

          opacity: fadeAnimation,

          child: SlideTransition(
            position: slideAnimation,
            child: child,
          ),
        );
      },
    );
  }
}