import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: SvgPicture.asset(
          'assets/bg.svg',
          colorFilter: const ColorFilter.mode(
              Color.fromARGB(50, 255, 255, 255), BlendMode.srcIn),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "shared playlists",
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
              SizedBox(
                height: 10,
              ),
              NewPlaylistButton(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Active ·",
                style: TextStyle(
                  fontFamily: "Gotham",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PlaylistCard(
                isActive: true,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Recent ·",
                style: TextStyle(
                  fontFamily: "Gotham",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PlaylistCard(
                name: "WomenTechies' 24",
                participants: 234,
                img: "assets/wt.png",
              ),
              SizedBox(
                height: 15,
              ),
              PlaylistCard(
                name: "Hexathon' 23",
                participants: 1200,
                img: "assets/hexathon.png"
              ),
            ],
          ),
        ),
      ),
    ]);
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
                                    ? Color.fromARGB(255, 0, 0, 0)
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

class NewPlaylistButton extends StatelessWidget {
  const NewPlaylistButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 59,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Icon(
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
