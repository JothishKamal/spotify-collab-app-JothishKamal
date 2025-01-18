import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/providers/playlist_provider.dart';

class PlaylistCard extends ConsumerWidget {
  const PlaylistCard({
    super.key,
    this.isActive = false,
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.memberCount,
  });

  final bool isActive;
  final String? name;
  final String? id;
  final String? imageUrl;
  final int? memberCount;

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
                  if (imageUrl != null && imageUrl!.isNotEmpty)
                    Container(
                      height: 57,
                      width: 57,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(imageUrl!),
                          fit: BoxFit.cover,
                          onError: (_, __) => const Icon(Icons.music_note,
                              size: 32, color: Colors.white),
                        ),
                      ),
                    )
                  else
                    Container(
                      height: 57,
                      width: 57,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive ? Colors.white : Colors.grey,
                      ),
                      child: Icon(Icons.music_note,
                          size: 32,
                          color: !isActive ? Colors.white : Colors.grey),
                    ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name ?? '',
                          style: TextStyle(
                            fontFamily: "Gotham",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: isActive ? Colors.white : Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/people.svg',
                              colorFilter: ColorFilter.mode(
                                  isActive
                                      ? const Color(0xfff5f5f5)
                                      : Colors.black,
                                  BlendMode.srcIn),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              memberCount?.toString() ?? '',
                              style: TextStyle(
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: isActive ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
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
                        context.push("/admin", extra: {"owner": isActive});
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(97, 31),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
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
