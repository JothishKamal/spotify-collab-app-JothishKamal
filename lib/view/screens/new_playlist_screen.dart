import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class NewPlaylistScreen extends StatelessWidget {
  const NewPlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(children: [
      Container(
        width: 1000,
        color: Color(0xff111111),
        child: SvgPicture.asset(
          'assets/bg.svg',
          colorFilter: const ColorFilter.mode(
              Color.fromARGB(50, 255, 255, 255), BlendMode.srcIn),
            fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "new shared playlist",
            style: TextStyle(
                fontFamily: "Gotham",
                fontWeight: FontWeight.w700,
                shadows: <Shadow>[
                  Shadow(offset: Offset(0, 1), color: Color(0xffDA84FE))
                ]),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: const Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create new Playlist ·",
                style: TextStyle(
                  fontFamily: "Gotham",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
