import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Collabify',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'Avenir Next',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
