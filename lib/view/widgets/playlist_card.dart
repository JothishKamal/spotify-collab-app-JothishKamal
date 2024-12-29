import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/providers/playlist_provider.dart';

class PlaylistCard extends ConsumerWidget {
  const PlaylistCard({
    super.key,
    this.isActive = false,
    required this.name,
    required this.id,
  });

  final bool isActive;
  final String? name;
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistNotifier = ref.read(playlistProvider.notifier);

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Container(
                    height: 57,
                    width: 57,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(Icons.music_note,
                        size: 32, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      name ?? '',
                      style: TextStyle(
                        fontFamily: "Gotham",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: isActive ? Colors.white : Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 97,
                    height: 31,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.white : const Color(0xff5822EE),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        playlistNotifier.selectedPlaylistUuid = id ?? '';
                        playlistNotifier.selectedPlaylistName = name ?? '';
                        context.push("/admin");
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        isActive ? "Manage" : "View",
                        style: TextStyle(
                          color:
                              isActive ? const Color(0xff5822EE) : Colors.white,
                          fontFamily: "Gotham",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
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
