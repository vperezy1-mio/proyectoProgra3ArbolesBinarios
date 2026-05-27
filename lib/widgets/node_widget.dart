import 'package:flutter/material.dart';

class NodeWidget extends StatelessWidget {

  final String value;

  const NodeWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: 70,
      height: 70,

      decoration: BoxDecoration(

        gradient: const LinearGradient(
          colors: [
            Colors.blue,
            Colors.lightBlue,
          ],
        ),

        borderRadius:
            BorderRadius.circular(35),

        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(
              0.2,
            ),

            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      alignment: Alignment.center,

      child: Text(
        value,

        style: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}