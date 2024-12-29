import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_collab_app/utils/api_util.dart';
import 'package:spotify_collab_app/view/models/playlist_success_response.dart';

final playlistProvider =
    StateNotifierProvider<PlaylistNotifier, List<Playlist>>((ref) {
  return PlaylistNotifier();
});

class Playlist {
  final String? name;
  final String? playlistUuid;

  Playlist({required this.name, this.playlistUuid});

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      name: json['name'],
      playlistUuid: json['playlist_uuid'],
    );
  }
}

class PlaylistNotifier extends StateNotifier<List<Playlist>> {
  PlaylistNotifier() : super([]);

  String? selectedPlaylistUuid;
  String? selectedPlaylistName;

  Future<void> fetchPlaylists() async {
    final response = await apiUtil.get('/v1/playlists');

    if (response.statusCode == 200) {
      final playlistResponse = PlaylistSuccessResponse.fromJson(response.data);

      if (playlistResponse.message == "Playlists successfully retrieved") {
        final playlists = playlistResponse.data
                ?.map((data) => Playlist(
                      name: data.name,
                      playlistUuid: data.playlistUuid,
                    ))
                .toList() ??
            [];

        state = playlists;
      }
    }
  }

  void selectPlaylist(String uuid) {
    selectedPlaylistUuid = uuid;
  }

  void selectPlaylistName(String name) {
    selectedPlaylistName = name;
  }
}
