import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_collab_app/utils/api_util.dart';
import 'package:spotify_collab_app/view/models/playlist_success_response.dart';

final playlistProvider =
    StateNotifierProvider<PlaylistNotifier, HomeScreenInfo>((ref) {
  return PlaylistNotifier();
});

class Playlist {
  final String? name;
  final String? playlistUuid;
  final String? imageUrl;
  final int? memberCount;

  Playlist(
      {required this.name, this.playlistUuid, this.imageUrl, this.memberCount});

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      name: json['name'],
      playlistUuid: json['playlist_uuid'],
      imageUrl: json['image_url'],
      memberCount: json['member_count'],
    );
  }
}

class HomeScreenInfo {
  final List<Playlist> ownedPlaylists;
  final List<Playlist> memberPlaylists;

  const HomeScreenInfo(
      {required this.ownedPlaylists, required this.memberPlaylists});

  HomeScreenInfo copyWith({
    List<Playlist>? ownedPlaylists,
    List<Playlist>? memberPlaylists,
  }) {
    return HomeScreenInfo(
      ownedPlaylists: ownedPlaylists ?? this.ownedPlaylists,
      memberPlaylists: memberPlaylists ?? this.memberPlaylists,
    );
  }
}

enum DeletePlaylistStatus { success, failure, error }

class PlaylistNotifier extends StateNotifier<HomeScreenInfo> {
  PlaylistNotifier()
      : super(const HomeScreenInfo(ownedPlaylists: [], memberPlaylists: []));
  final isLoadingProvider = StateProvider<bool>((ref) => false);

  String? selectedPlaylistUuid;
  String? selectedPlaylistName;

  Future<void> fetchPlaylists() async {
    try {
      final response = await apiUtil.get('/v1/playlists');
      log(await SharedPreferences.getInstance()
          .then((value) => value.getString('access_token').toString()));
      log(jsonEncode(response.data));

      if (response.statusCode == 200) {
        final playlistResponse =
            PlaylistSuccessResponse.fromJson(response.data);

        if (playlistResponse.message == "Playlists successfully retrieved") {
          final ownedPlaylists = playlistResponse.data?.owner
                  ?.map((data) => Playlist(
                        name: data.name,
                        playlistUuid: data.playlistUuid,
                        imageUrl: data.imageUrl,
                        memberCount: data.memberCount,
                      ))
                  .toList() ??
              [];
          final memberPlaylists = playlistResponse.data?.member
                  ?.map((data) => Playlist(
                        name: data.name,
                        playlistUuid: data.playlistUuid,
                        imageUrl: data.imageUrl,
                        memberCount: data.memberCount,
                      ))
                  .toList() ??
              [];

          state = state.copyWith(
              ownedPlaylists: ownedPlaylists, memberPlaylists: memberPlaylists);
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<DeletePlaylistStatus> deletePlaylist(String playlistUuid) async {
    try {
      final response = await apiUtil.delete('/v1/playlists/$playlistUuid');
      log(jsonEncode(response.data));

      if (response.statusCode == 200) {
        final playlistResponse =
            PlaylistSuccessResponse.fromJson(response.data);

        if (playlistResponse.message == "Playlist successfully deleted") {
          final ownedPlaylists = state.ownedPlaylists
              .where((playlist) => playlist.playlistUuid != playlistUuid)
              .toList();
          final memberPlaylists = state.memberPlaylists
              .where((playlist) => playlist.playlistUuid != playlistUuid)
              .toList();

          state = state.copyWith(
              ownedPlaylists: ownedPlaylists, memberPlaylists: memberPlaylists);

          return DeletePlaylistStatus.success;
        }
      }
      return DeletePlaylistStatus.failure;
    } catch (e) {
      log(e.toString());
      return DeletePlaylistStatus.error;
    }
  }

  void selectPlaylist(String uuid) {
    selectedPlaylistUuid = uuid;
  }

  void selectPlaylistName(String name) {
    selectedPlaylistName = name;
  }
}
