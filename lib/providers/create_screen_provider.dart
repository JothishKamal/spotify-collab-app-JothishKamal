import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer';

import 'package:spotify_collab_app/utils/api_util.dart';

class CreateScreenNotifier extends StateNotifier<AsyncValue<void>> {
  CreateScreenNotifier() : super(const AsyncValue.data(null));

  Future<({bool success, String message})> createPlaylist(String name) async {
    try {
      state = const AsyncValue.loading();

      final response = await apiUtil.post('/v1/playlists', {
        'name': name,
      });

      log(response.toString());

      if (response.statusCode == 200 &&
          response.data["message"] == "playlist successfully created") {
        state = const AsyncValue.data(null);
        return (success: true, message: 'Playlist successfully created');
      }

      state = const AsyncValue.data(null);
      return (success: false, message: 'Failed to create playlist');
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return (success: false, message: 'Failed to create playlist');
    }
  }
}

final createScreenProvider =
    StateNotifierProvider<CreateScreenNotifier, AsyncValue<void>>((ref) {
  return CreateScreenNotifier();
});