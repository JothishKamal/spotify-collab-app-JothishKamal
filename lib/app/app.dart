import 'package:flutter/material.dart';

import 'package:spotify_collab_app/app/router/router.dart';
import 'package:spotify_collab_app/app/theme/theme.dart';

class CollabifyApp extends StatelessWidget {
  const CollabifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kalculate',
      theme: darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

void main() {
  runApp(const CollabifyApp());
}
