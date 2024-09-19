import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/providers/playlist_provider.dart';

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
                        return Expanded(
                          child: ListView.builder(
                            itemCount: playlists.length,
                            itemBuilder: (context, index) {
                              final playlist = playlists[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: PlaylistCard(
                                  name: playlist.name,
                                ),
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

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(
            fontFamily: "Gotham",
            fontWeight: FontWeight.w700,
            fontSize: 34,
            shadows: <Shadow>[
              Shadow(offset: Offset(0, 1), color: Color(0xffDA84FE)),
            ],
          ),
        ),
        Column(
          children: [
            SvgPicture.asset('assets/highlight.svg'),
            const SizedBox(height: 30),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
    this.isActive = false,
    required this.name,
  });

  final bool isActive;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 102,
            decoration: BoxDecoration(
              color: isActive ? const Color(0xff5822EE) : Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    height: 57,
                    width: 57,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(Icons.music_note, size: 32),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontFamily: "Gotham",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: isActive ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 97,
                      height: 31,
                      decoration: BoxDecoration(
                        color:
                            !isActive ? const Color(0xff5822EE) : Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Text(
                          isActive ? "Manage" : "View",
                          style: TextStyle(
                            color: isActive
                                ? const Color(0xff5822EE)
                                : Colors.white,
                            fontFamily: "Gotham",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NewPlaylistButton extends StatelessWidget {
  const NewPlaylistButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 59,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: const Icon(
              Icons.add_circle,
              color: Color(0xff5822EE),
              size: 43,
            ),
          ),
        ),
      ],
    );
  }
}
