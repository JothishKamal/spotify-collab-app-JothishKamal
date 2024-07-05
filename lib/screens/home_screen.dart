import 'package:flutter/material.dart';

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
            Container(child: const SizedBox(height: 100,), color: Colors.transparent),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.home_outlined, size: 36),
                title: Center(child: Text('Home', style: TextStyle(fontSize: 28))),
                onTap: () {
                  // Handle the tap
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.search_outlined, size: 36),
                title: Center(child: Text('Search', style: TextStyle(fontSize: 28))),
                onTap: () {
                  // Handle the tap
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.grid_view_outlined, size: 36),
                title: Center(child: Text('Your Events', style: TextStyle(fontSize: 28))),
                onTap: () {
                  // Handle the tap
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.account_circle_outlined, size: 36),
                title: Center(child: Text('Your Profile', style: TextStyle(fontSize: 28))),
                onTap: () {
                  // Handle the tap
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.settings_outlined, size: 36),
                title: Center(child: Text('Settings', style: TextStyle(fontSize: 28))),
                onTap: () {
                  // Handle the tap
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.queue_music_outlined, size: 36),
                title: Center(child: Text('Your Playlists', style: TextStyle(fontSize: 28))),
                onTap: () {
                  // Handle the tap
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
