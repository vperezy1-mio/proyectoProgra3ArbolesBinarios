import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme =
      ThemeData(

    useMaterial3: true,

    colorSchemeSeed:
        Colors.blue,

    scaffoldBackgroundColor:
        const Color(0xFFF5F7FA),

    appBarTheme:
        const AppBarTheme(

      centerTitle: true,

      elevation: 2,

      backgroundColor:
          Colors.blue,

      foregroundColor:
          Colors.white,
    ),

    elevatedButtonTheme:
        ElevatedButtonThemeData(

      style:
          ElevatedButton.styleFrom(

        padding:
            const EdgeInsets.symmetric(
          vertical: 16,
        ),

        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(14),
        ),

        textStyle:
            const TextStyle(
          fontSize: 17,
          fontWeight:
              FontWeight.w600,
        ),
      ),
    ),

    inputDecorationTheme:
        InputDecorationTheme(

      filled: true,

      fillColor: Colors.white,

      border:
          OutlineInputBorder(

        borderRadius:
            BorderRadius.circular(14),

        borderSide: BorderSide.none,
      ),

      enabledBorder:
          OutlineInputBorder(

        borderRadius:
            BorderRadius.circular(14),

        borderSide:
            BorderSide.none,
      ),

      focusedBorder:
          OutlineInputBorder(

        borderRadius:
            BorderRadius.circular(14),

        borderSide:
            const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      ),

      contentPadding:
          const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),
    ),

    cardTheme: CardThemeData(

      elevation: 3,

      shape:
          RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),
    ),
  );
}