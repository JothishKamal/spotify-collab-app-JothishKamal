import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_collab_app/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CollabifyApp(),
    ),
  );
}
