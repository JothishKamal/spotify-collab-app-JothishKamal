import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_collab_app/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
      ]),
    );
  }
}

class PlaylistCard extends StatelessWidget {
  const PlaylistCard(
      {super.key,
      this.isActive = false,
      this.name = "DevJams' 24",
      this.participants = 587,
      this.img = "assets/dino.png"});

  final bool isActive;
  final String name;
  final int participants;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: 102,
              decoration: BoxDecoration(
                  color: isActive ? const Color(0xff5822EE) : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(children: [
                  Row(
                    children: [
                      Container(
                        height: 57,
                        width: 57,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(img), fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: !isActive
                                    ? const Color.fromARGB(255, 0, 0, 0)
                                    : Colors.white),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.people_alt_outlined,
                                size: 19,
                                color: !isActive
                                    ? const Color(0xff000000)
                                    : Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                participants.toString(),
                                style: TextStyle(
                                  fontFamily: "Gotham",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: !isActive
                                      ? const Color(0xff000000)
                                      : Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
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
                  )
                ]),
              )),
        ),
      ],
    );
  }
}
