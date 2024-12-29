import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicListItem extends ConsumerWidget {
  final String title;
  final String? subtitle;
  final String? imageUrl;
  final bool isPlaylist;
  final bool isRequest;
  final bool isParticipant;

  const MusicListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.imageUrl,
    this.isPlaylist = false,
    this.isRequest = false,
    this.isParticipant = false,
  });

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      leading: isParticipant
          ? ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      getRandomColor(),
                      Colors.black,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    title[0].toUpperCase(),
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF)
                          .withAlpha((0.8 * 255).toInt()),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.network(
                imageUrl!,
              ),
            ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Gotham',
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      subtitle: isParticipant
          ? null
          : Text(
              subtitle ?? '',
              style: const TextStyle(
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w300,
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
      trailing: isRequest
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.check, color: Colors.green),
                  onPressed: () {},
                ),
              ],
            )
          : isParticipant
              ? null
              : InkWell(
                  onTap: () {},
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.more_vert,
                      color: Color(0xff737373),
                    ),
                  ),
                ),
    );
  }
}
