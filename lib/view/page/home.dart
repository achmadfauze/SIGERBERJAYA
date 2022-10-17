import 'package:first_app/view/page/menu/homePage.dart';
// import 'package:first_app/view/page/menu/NewsPage.dart';
import 'package:first_app/view/page/menu/cityPage.dart';
import 'package:first_app/view/page/menu/newsPage.dart';
import 'package:first_app/view/page/menu/tessssst.dart';
import 'package:first_app/view/page/menu/profilPage.dart';
import 'package:first_app/view/page/menu/savePage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home extends StatefulWidget {
  String? uid;
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screen = [
      HomePage(
        uid: _currentUser != null ? _currentUser!.id.toString() : "",
        img: _currentUser != null ? _currentUser!.photoUrl.toString() : "",
      ),
      CityPage(
        uid: _currentUser != null ? _currentUser!.id.toString() : "",
      ),
      NewsPage(
        uid: _currentUser != null ? _currentUser!.id.toString() : "",
      ),
      SavePage(
        uid: _currentUser != null ? _currentUser!.id.toString() : "",
      ),
      ProfilPage(
        uid: _currentUser != null ? _currentUser!.id.toString() : "",
      )
    ];
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
