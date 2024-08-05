import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_collab_app/view/widgets/background_widget.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Color(0xFF5822EE),
        child: SvgPicture.asset(
          'assets/bg.svg',
          colorFilter:
              const ColorFilter.mode(Color(0xffd056fc), BlendMode.srcIn),
        ),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "Connect to Spotify",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Gotham",
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  const Text(
                    "WELCOME TO\nCOLLABIFY",
                    style: TextStyle(
                      fontFamily: "Gotham",
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 0.8,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1db954),
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
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )),
    ]);
  }
}
