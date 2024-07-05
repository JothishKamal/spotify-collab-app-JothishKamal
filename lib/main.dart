import 'package:flutter/material.dart';
import 'package:spotify_collab_app/screens/home_screen.dart';
import 'package:spotify_collab_app/screens/login_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Collab',
      theme: darkTheme,
      home: const LoginScreen(),
    );
  }
}
