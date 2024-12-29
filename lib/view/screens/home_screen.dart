import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/providers/playlist_provider.dart';
import 'package:spotify_collab_app/view/widgets/custom_title.dart';
import 'package:spotify_collab_app/view/widgets/new_playlist_button.dart';
import 'package:spotify_collab_app/view/widgets/playlist_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistNotifier = ref.read(playlistProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomTitle(
          title: "shared playlists",
        ),
        backgroundColor: Colors.transparent,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await playlistNotifier.fetchPlaylists();
        },
        child: Stack(
          children: [
            SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: SvgPicture.asset(
                'assets/bg.svg',
                colorFilter:
                    const ColorFilter.mode(Color(0xffd1dfdb), BlendMode.srcIn),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create new Playlist ·",
                    style: TextStyle(
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    onTap: () => context.go('/create'),
                    child: Ink(child: const NewPlaylistButton()),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Active ·",
                    style: TextStyle(
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder(
                    future: playlistNotifier.fetchPlaylists(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Failed to load playlists.'));
                      } else {
                        final playlists = ref.watch(playlistProvider);
                        if (playlists.isEmpty) {
                          return const Center(
                              child: Text('No playlists found'));
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemCount: playlists.length,
                            itemBuilder: (context, index) {
                              final playlist = playlists[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: PlaylistCard(
                                    name: playlist.name,
                                    id: playlist.playlistUuid),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


