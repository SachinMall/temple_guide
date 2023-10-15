import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temple_guide/homepage.dart';
import 'package:temple_guide/screen/more.dart';
import 'package:temple_guide/screen/profile.dart';
import 'package:temple_guide/screen/search.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var pageoptions = [
    const HomePage(),
    const Search(),
    const Profile(),
    const More(),
  ];

  int _currentindex = 0;
  final int _currentindex2 = 0;
  void onTabSwitch(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            text: TextSpan(
                text: 'Templeguide',
                style: GoogleFonts.archivo(fontSize: 23),
                children: [
              TextSpan(
                text: '.com',
                style: GoogleFonts.archivo(fontSize: 18),
              )
            ])),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.alarm),
            iconSize: 26,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            iconSize: 26,
          ),
          const SizedBox(
            width: 5,
          ),
        ],
        backgroundColor: Colors.yellow[800],
        elevation: 0,
      ),
      drawer: const Drawer(),
      body: pageoptions[_currentindex],
      bottomNavigationBar: Container(
        color: Colors.red,
        child: BottomNavigationBar(
          onTap: onTabSwitch,
          currentIndex: _currentindex,
          showUnselectedLabels: true,
          selectedItemColor: Colors.red[900],
          unselectedItemColor: Colors.grey,
          iconSize: 25,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.grid_view_outlined,
                ),
                label: "More"),
          ],
          selectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
