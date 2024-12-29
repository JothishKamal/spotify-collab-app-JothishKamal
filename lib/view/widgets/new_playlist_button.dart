import 'package:flutter/material.dart';

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
