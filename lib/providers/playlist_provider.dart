import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_collab_app/utils/api_util.dart';

final playlistProvider =
    StateNotifierProvider<PlaylistNotifier, List<Playlist>>((ref) {
  return PlaylistNotifier();
});

class Playlist {
  final String name;

  Playlist({required this.name});

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      name: json['name'],
    );
  }
}

class PlaylistNotifier extends StateNotifier<List<Playlist>> {
  PlaylistNotifier() : super([]);

  Future<void> fetchPlaylists() async {
    final response = await apiUtil.get('/v1/playlists');
    log(response.data.toString());
    if (response.statusCode == 200) {
      if (response.data["message"] == "Playlists successfully retrieved") {
        final playlists = (response.data["data"] as List)
            .map((data) => Playlist.fromJson(data))
            .toList();
        state = playlists;
      }
    }
  }
}
