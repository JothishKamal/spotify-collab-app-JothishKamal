import 'package:flutter/material.dart';

class SongWidget extends StatelessWidget {
  const SongWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(50, 0, 0, 0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
            Container(
              width: 34,
              height: 34,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xff24bb58)),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.black,
                size: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
