import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),

      // voile blanc léger pour rendre les textes lisibles
      child: Container(
        color: Colors.white.withOpacity(0.07),
        child: child,
      ),
    );
  }
} 

