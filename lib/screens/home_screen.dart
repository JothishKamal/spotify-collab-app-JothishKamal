import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Collabify',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontFamily: 'Avenir Next',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                  child: const SizedBox(
                    height: 100,
                  ),
                  color: Colors.transparent),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.home_outlined, size: 36),
                  title: Center(
                      child: Text('Home', style: TextStyle(fontSize: 28))),
                  onTap: () {
                    // Handle the tap
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.search_outlined, size: 36),
                  title: Center(
                      child: Text('Search', style: TextStyle(fontSize: 28))),
                  onTap: () {
                    // Handle the tap
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.grid_view_outlined, size: 36),
                  title: Center(
                      child:
                          Text('Your Events', style: TextStyle(fontSize: 28))),
                  onTap: () {
                    // Handle the tap
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.account_circle_outlined, size: 36),
                  title: Center(
                      child:
                          Text('Your Profile', style: TextStyle(fontSize: 28))),
                  onTap: () {
                    // Handle the tap
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.settings_outlined, size: 36),
                  title: Center(
                      child: Text('Settings', style: TextStyle(fontSize: 28))),
                  onTap: () {
                    // Handle the tap
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.queue_music_outlined, size: 36),
                  title: Center(
                      child: Text('Your Playlists',
                          style: TextStyle(fontSize: 28))),
                  onTap: () {
                    // Handle the tap
                  },
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff000000),
                Color(0xff051e0f),
                Color(0xff083216),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Playlists",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      RecentCard(),
                      SizedBox(width: 20),
                      RecentCard(),
                      SizedBox(width: 20),
                      RecentCard(),
                      SizedBox(width: 20),
                      RecentCard(),
                      SizedBox(width: 20),
                      RecentCard(),
                      SizedBox(width: 20),
                      RecentCard(),
                      SizedBox(width: 20),
                    ]),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Your Favourites",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      SongWidget(),
                      SizedBox(height: 20),
                      SongWidget(),
                      SizedBox(height: 20),
                      SongWidget(),
                      SizedBox(height: 20),
                    ],
                  ),
                  Spacer(),
                  NowPlaying(),
                ],
              ),
            ),
          ),
        ));
  }
}

class NowPlaying extends StatelessWidget {
  const NowPlaying({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color.fromARGB(255, 128, 33, 21), Color(0xff646B35)])),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffC14231)),
              ),
              SizedBox(width: 8),
              Text(
                "From Me to You - Mono / Remastered",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffB2B2B2),
              backgroundColor: Color.fromARGB(255, 128, 33, 21),
            ),
          ),
        )
      ]),
    );
  }
}

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
        color: Color.fromARGB(50, 0, 0, 0),
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
                  color: Color(0xff24bb58)),
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

class RecentCard extends StatelessWidget {
  const RecentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98,
      height: 130,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff4d5350),
            Color(0xff2f2e27),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
    );
  }
}
