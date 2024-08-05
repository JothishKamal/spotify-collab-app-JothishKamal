import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/view/screens/home_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
  ],
);
