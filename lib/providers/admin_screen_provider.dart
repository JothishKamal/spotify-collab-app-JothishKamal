import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RequestAction { none, acceptAll, rejectAll }

final tabProvider = StateProvider<int>((ref) => 0);

final requestActionProvider =
    StateProvider<RequestAction>((ref) => RequestAction.none);
