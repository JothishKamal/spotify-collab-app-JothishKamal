import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5822EE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        SizedBox(
          height: 1000,
          width: 1000,
          child: SvgPicture.asset(
            'assets/bg_splash.svg',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "welcome to collabify",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Gotham",
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Unlock a world of music possibilities by connecting your "
                "Spotify account and dive into a seamless experience tailored "
                "just for you.",
                style: TextStyle(
                  fontFamily: "Product-Sans",
                  fontSize: 16.53,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xff1db954),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                height: 45,
                width: 225,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Connect",
                      style: TextStyle(
                        fontFamily: "Gotham",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset("assets/logo.svg")
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Authorize Collabify to access your Spotify account, "
                "enabling you to explore, play and share music with friends "
                "effortlessly.",
                style: TextStyle(
                  fontFamily: "Gotham",
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  backgroundColor: Color.fromARGB(13, 0, 0, 0)
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
            ],
          ),
        ),
      ]),
    );
  }
}
