import 'package:first_app/view/page/menu/homePage.dart';
import 'package:first_app/view/page/menu/NewsPage.dart';
import 'package:first_app/view/page/menu/cityPage.dart';
import 'package:first_app/view/page/menu/TestApi.dart';
import 'package:first_app/view/page/menu/profilPage.dart';
import 'package:first_app/view/page/menu/savePage.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  var _currentIndex = 0;
  final screen = [HomePage(), CityPage(), NewsPage(), SavePage(), ProfilPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: screen[_currentIndex],
        // appBar: AppBar(
        //   title: Text(Home.title),
        // ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Beranda"),
              // selectedColor: Color(0xff438afe),
              selectedColor: Color(0xff14C38E),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.grid_view),
              title: Text("Kota"),
              selectedColor: Color(0xff14C38E),
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.format_list_bulleted),
              title: Text("Berita"),
              selectedColor: Color(0xff14C38E),
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.bookmark),
              title: Text("Simpan"),
              selectedColor: Color(0xff14C38E),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profil"),
              selectedColor: Color(0xff14C38E),
            ),
          ],
        ),
      ),
    );
  }
}
