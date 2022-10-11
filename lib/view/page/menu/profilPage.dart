import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/view/component/editBahasa.dart';
import 'package:first_app/view/component/editProfile.dart';
import 'package:first_app/view/page/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../component/Emergency.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool notif = false;
  MaterialColor mycolor =
      MaterialColor(Color.fromRGBO(20, 195, 142, 1).value, <int, Color>{
    50: Color.fromRGBO(20, 195, 142, 0.1),
    100: Color.fromRGBO(20, 195, 142, 0.2),
    200: Color.fromRGBO(20, 195, 142, 0.3),
    300: Color.fromRGBO(20, 195, 142, 0.4),
    400: Color.fromRGBO(20, 195, 142, 0.5),
    500: Color.fromRGBO(20, 195, 142, 0.6),
    600: Color.fromRGBO(20, 195, 142, 0.7),
    700: Color.fromRGBO(20, 195, 142, 0.8),
    800: Color.fromRGBO(20, 195, 142, 0.9),
    900: Color.fromRGBO(20, 195, 142, 1),
  });

  GoogleSignInAccount? _currentUser;
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      // if (_currentUser != null) {
      //   _handleGetContact(_currentUser!);
      // }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
  // User? _currentUser;
  // User? _currentUser = await FirebaseAuth.instance.currentUser;
  // void getCurrentUser() {
  //   _currentUser = firebaseAuth.currentUser;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   Firebase.initializeApp().whenComplete(() {
  //     print("completed");
  //     setState(() {
  //       FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //         if (user != null) {
  //           _currentUser = user;
  //         }
  //       });
  //     });
  //   });
  // }
  // Future getCurrentUser() async {
  //   _currentUser = await FirebaseAuth.instance.currentUser;
  // }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    (_currentUser != null)
        ? print(_currentUser!.displayName.toString())
        : print("tidak ada");
    final appBar = AppBar(
      title: Text("Profil"),
    );
    final bodyHeight = MediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        // primarySwatch: MaterialColor(0xff14C38E, {
        //   100: Color.fromARGB(255, 20, 124, 93),
        // }),
        primarySwatch: mycolor,
        primaryColor: Color(0xff14C38E),
        // iconTheme: IconThemeData(color: Colors.amber)),
        listTileTheme: ListTileThemeData(iconColor: Color(0xff14C38E)),
      ),
      home: Scaffold(
        appBar: appBar,
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(top: bodyHeight * 0.05),
            children: [
              _currentUser == null
                  ? SizedBox(
                      height: 20,
                    )
                  : CircleAvatar(
                      radius: bodyWidth * 0.20,
                      backgroundColor: Colors.grey,
                      child: ClipOval(
                        child: Column(
                          children: [
                            new SizedBox(
                              width: bodyWidth * 0.40,
                              height: bodyWidth * 0.40,
                              child: Image.network(
                                _currentUser != null
                                    ? _currentUser!.photoUrl.toString()
                                    : '',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.only(top: bodyHeight * 0.05),
                child: Text(
                  _currentUser != null
                      ? _currentUser!.displayName.toString()
                      : '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 16 + (bodyHeight * 0.01),
                      fontWeight: FontWeight.bold),
                ),
              ),
              //profile
              _currentUser == null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: ListTile(
                        title: Text("Masuk",
                            style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                            )),
                        leading: Icon(
                          Icons.login,
                          // color: Colors.blue,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          top: bodyHeight * 0.02, left: 12, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              _currentUser != null
                                  ? _currentUser!.email.toString()
                                  : '',
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                              ),
                            ),
                            leading: Icon(
                              Icons.email,
                              // color: Colors.blue,
                            ),
                          ),
                          ListTile(
                            title: Text("25-09-2022",
                                style: TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                )),
                            leading: Icon(
                              Icons.watch_later_sharp,
                              // color: Colors.blue,
                            ),
                          ),
                          ListTile(
                            title: Text("Edit Profile",
                                style: TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                )),
                            leading: Icon(
                              Icons.edit,
                              // color: Colors.blue,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) {
                                    return EditProfile();
                                  }),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            title: Text("Keluar",
                                style: TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                )),
                            leading: Icon(
                              Icons.logout,
                              // color: Colors.blue,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            onTap: () async {
                              _handleSignOut();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: EdgeInsets.only(top: bodyHeight * 0.02, left: 30),
                child: Text(
                  "Pengaturan Umum",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: bodyHeight * 0.02, left: 12, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Dapatkan Pemberitahuan",
                          style: TextStyle(
                            fontFamily: 'Roboto-Regular',
                          )),
                      leading: Icon(
                        Icons.notifications,
                        // color: Colors.blue,
                      ),
                      trailing: Switch(
                        value: notif,
                        onChanged: (value) {
                          setState(() {
                            notif = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text("Bahasa",
                          style: TextStyle(
                            fontFamily: 'Roboto-Regular',
                          )),
                      leading: Icon(
                        Icons.language,
                        // color: Colors.blue,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) {
                              return EditBahasa();
                            }),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width * 0.2,
          child: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmergencyPage()));
            },
            child: Image(
              image: AssetImage(
                'assets/icons/emergency.png',
              ),
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
