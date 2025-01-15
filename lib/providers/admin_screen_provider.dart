import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_collab_app/providers/playlist_provider.dart';
import 'package:spotify_collab_app/utils/api_util.dart';
import 'package:spotify_collab_app/view/models/songs_response.dart';

enum RequestAction { none, acceptAll, rejectAll }

final tabProvider = StateProvider<int>((ref) => 0);

final requestActionProvider =
    StateProvider<RequestAction>((ref) => RequestAction.none);

final songsProvider =
    StateNotifierProvider<SongsNotifier, SongsResponse>((ref) {
  return SongsNotifier();
});

class SongsNotifier extends StateNotifier<SongsResponse> {
  SongsNotifier() : super(SongsResponse());

  Future<void> fetchSongs(String uuid) async {
    var prefs = await SharedPreferences.getInstance();
    log(prefs.getString('access_token').toString());
    log(uuid);
    try {
      final response = await apiUtil.get(
        '/v1/songs/$uuid',
      );

      log('Songs fetched');
      if (response.statusCode == 200) {
        final data = SongsResponse.fromJson(response.data);

        state = state.copyWith(
          data: data.data,
          message: data.message,
          statusCode: data.statusCode,
          success: data.success,
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void clearSongs() {
    final emptySongs = SongsResponse();

    state = state.copyWith(
      data: emptySongs.data,
      message: emptySongs.message,
      statusCode: emptySongs.statusCode,
      success: emptySongs.success,
    );
  }

  Future<bool> acceptSong(String uuid, String uri) async {
    try {
      final response = await apiUtil.post(
        '/v1/songs/accept',
        {
          'playlist_uuid': uuid,
          'song_uri': uri,
        },
      );

      log('Song accepted');
      if (response.statusCode == 200) {
        fetchSongs(uuid);
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> rejectSong(String uuid, String uri) async {
    try {
      final response = await apiUtil.post(
        '/v1/songs/reject',
        {
          'playlist_uuid': uuid,
          'song_uri': uri,
        },
      );

      log('Song rejected');
      if (response.statusCode == 200) {
        fetchSongs(uuid);
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<DeleteStatus> deleteSong(
      String playlistUuid, String songUri) async {
    try {
      final response = await apiUtil.delete('/v1/songs', data: {
        'playlist_uuid': playlistUuid,
        'song_uri': songUri,
      });
      log(jsonEncode(response.data));

      if (response.statusCode == 200) {
        fetchSongs(playlistUuid);
        return DeleteStatus.success;
      }

      return DeleteStatus.failure;
    } catch (e) {
      log(e.toString());
      return DeleteStatus.error;
    }
  }
}
