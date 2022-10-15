import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/model/userModel.dart';
import 'package:first_app/view/component/editBahasa.dart';
import 'package:first_app/view/component/editProfile.dart';
import 'package:first_app/view/page/home.dart';
import 'package:first_app/view/page/login.dart';
import 'package:flutter/foundation.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../model/theme.dart';
import '../../component/Emergency.dart';

class ProfilPage extends StatefulWidget {
  final String? uid;
  const ProfilPage({super.key, this.uid});

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
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;
  user Users = new user();
  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    fetchJson().then((value) {
      setState(() {
        Users = value;
      });
    });
    super.initState();
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  dynamic currentTime = DateFormat("yyyy-MM-dd").format(DateTime.now());

  Future<user> fetchJson() async {
    var response = await http
        .get(Uri.parse('http://api-siger.uacak.com/api/v1/user/${widget.uid}'));

    user slist = new user();
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      // print(urjson['name']);
      slist = user(
          userCode: urjson['userCode'],
          uid: urjson['uid'],
          email: urjson['email'],
          image: urjson['image'],
          name: urjson['name'],
          createAt: urjson['createAt']);
    }

    return slist;
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;

    final appBar = AppBar(
      elevation: 0,
      title: Text(
        "Profil",
        style: regularTextStyle.copyWith(fontSize: 18, color: Colors.white),
      ),
      backgroundColor: Color(
        0xff00a877,
      ),
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
                                    ? Users.image.toString()
                                    : '',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.only(top: bodyHeight * 0.03),
                child: Text(
                  _currentUser != null
                      // ? _currentUser!.displayName.toString()
                      ? Users.name.toString()
                      : '',
                  textAlign: TextAlign.center,
                  style: regularTextStyle.copyWith(
                      fontSize: 16 + (bodyHeight * 0.01),
                      fontWeight: FontWeight.bold),
                ),
              ),
              //profile

              _currentUser == null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: ListTile(

                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) {
                                return LoginPage();
                              }),
                            ),
                          );
                        },
                        title: Text(
                          "Masuk",
                          style: regularTextStyle.copyWith(fontSize: 16))
                        ),
                        leading: Icon(
                          Icons.login,
                          // color: Colors.blue,
                        ),
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
                                  // ? _currentUser!.email.toString()
                                  ? Users.email.toString()
                                  : '',
                              style: regularTextStyle.copyWith(fontSize: 16),
                            ),
                            leading: Icon(
                              Icons.email,
                              // color: Colors.blue,
                            ),
                          ),
                          ListTile(

                            title: Text(Users.createAt.toString(),
                                style: regularTextStyle.copyWith(fontSize: 16)),

                            title: Text(currentTime.toString(),
                                style: regularTextStyle.copyWith(fontSize: 16)),

                            leading: Icon(
                              Icons.watch_later_sharp,
                              // color: Colors.blue,
                            ),
                          ),
                          ListTile(
                            title: Text("Edit Profile",
                                style: regularTextStyle.copyWith(fontSize: 16)),
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
                                    return EditProfile(
                                      User: Users,
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            title: Text("Keluar",
                                style: regularTextStyle.copyWith(fontSize: 16)),
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
                child: Text("Pengaturan Umum",
                    style: regularTextStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: bodyHeight * 0.02, left: 12, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Dapatkan Pemberitahuan",
                          style: regularTextStyle.copyWith(fontSize: 16)),
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
                          style: regularTextStyle.copyWith(fontSize: 16)),
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
            backgroundColor: Colors.yellow,
            onPressed: () => slideRightWidget(
              newPage: EmergencyPage(),
              context: context,
            ),
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
