import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_collab_app/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:text_marquee/text_marquee.dart';

class YayScreen extends ConsumerStatefulWidget {
  const YayScreen({super.key});

  @override
  ConnectScreenState createState() => ConnectScreenState();
}

class ConnectScreenState extends ConsumerState<YayScreen> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> _launchSpotifyLogin() async {
    const url = '$devUrl/v1/auth/spotify/login/app';
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5822EE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(
            'assets/bg_splash.svg',
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
          child: Column(
            children: [
              Text(
                'Yay!',
                style: TextStyle(
                  fontFamily: 'Gotham',
                  shadows: <Shadow>[
                    Shadow(
                      color: Color(0xff000000),
                      offset: Offset(0, 2),
                    ),
                  ],
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              Text(
                'Your Event is Created!',
                style: TextStyle(
                  fontFamily: 'Gotham',
                  shadows: <Shadow>[
                    Shadow(
                      color: Color(0xff000000),
                      offset: Offset(0, 2),
                    ),
                  ],
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Spacer(),
              PlaylistCard(
                isActive: true,
                name: "DevJams' 24",
                img: "assets/dino.png",
                host: "Souvik",
              ),
              SizedBox(
                height: 100,
              ),
              Spacer(),
            ],
          ),
        )
      ]),
    );
  }
}

class PlaylistCard extends StatelessWidget {
  const PlaylistCard(
      {super.key,
      this.isActive = false,
      this.name = "DevJams' 24",
      this.host = "Souvik",
      this.img = "assets/dino.png"});

  final bool isActive;
  final String name;
  final String img;
  final String host;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: 189,
              decoration: BoxDecoration(
                  color: isActive ? const Color(0xff111111) : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffda84fe),
                      spreadRadius: 0,
                      offset: Offset(0, 5),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 78,
                        width: 78,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(img), fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Row(children: [
                            const Text(
                              "Event:",
                              style: TextStyle(
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w700,
                                fontSize: 19,
                                color: Color(0xff5822EE),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextMarquee(
                              name,
                              style: const TextStyle(
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w700,
                                fontSize: 19,
                              ),
                            )
                          ]),
                          Row(children: [
                            const Text(
                              "Host:",
                              style: TextStyle(
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w700,
                                fontSize: 19,
                                color: Color(0xff5822EE),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextMarquee(
                              host,
                              style: const TextStyle(
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w700,
                                fontSize: 19,
                              ),
                            )
                          ]),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(children: [
                        Container(
                          width: 123,
                          height: 36,
                          decoration: BoxDecoration(
                            color: isActive
                                ? const Color(0xff5822EE)
                                : Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                color: !isActive
                                    ? const Color(0xff5822EE)
                                    : Colors.white,
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 123,
                          height: 36,
                          decoration: BoxDecoration(
                            color: !isActive
                                ? const Color(0xff5822EE)
                                : Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              "Continue",
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
                      ]),
                    ),
                  )
                ]),
              )),
        ),
      ],
    );
  }
}
