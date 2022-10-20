import 'package:file_picker/file_picker.dart';
import 'package:first_app/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProfile extends StatefulWidget {
  final user User;
  const EditProfile({super.key, required this.User});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? name;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;
  bool loading = false;

  TextEditingController userName = new TextEditingController();
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        loading = true;
      });
    });
    _googleSignIn.signInSilently();
    setState(() {
      name = widget.User.name.toString();
      userName.text = name.toString();
    });
  }

  // void refreshData() {
  //   fetchJson().then((value) {
  //     setState(() {
  //       _Tour.clear();
  //       _Tour.addAll(value);
  //     });
  //   });
  // }

  // onGoBack(dynamic value) {
  //   refreshData();
  //   setState(() {});
  // }

  Future<http.Response> updateUser(String name) {
    // print(widget.User.uid);
    return http.patch(
      Uri.parse(
          'https://api.siger.uacak.com/public/api/v1/user/${widget.User.uid}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"name": name}),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final appBar = AppBar(
      title: Text("Edit Profile"),
      backgroundColor: Color(
        0xff00a877,
      ),
    );
    final bodyHeight = MediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    if (loading == false) {
      return Scaffold(
        body: Container(
          child: Center(
            child: Text("Loading..."),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: appBar,
        body: ListView(
          padding: EdgeInsets.only(top: MediaQueryHeight * 0.1),
          children: [
            CircleAvatar(
              radius: bodyWidth * 0.25,
              backgroundColor: Colors.grey,
              child: Stack(
                children: [
                  ClipOval(
                    child: new SizedBox(
                      width: bodyWidth * 0.5,
                      height: bodyWidth * 0.5,
                      child: Image.network(
                        _currentUser!.photoUrl != null
                            // ? _currentUser!.photoUrl.toString()
                            ? widget.User.image.toString()
                            : "",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: -15,
                  //   child: RawMaterialButton(
                  //     // onPressed: () {},
                  //     onPressed: () async {
                  //       var picked = await FilePicker.platform.pickFiles(
                  //           type: FileType.custom,
                  //           allowMultiple: false,
                  //           allowedExtensions: ['jpg', 'jpeg', 'png']);
                  //       if (picked != null) {
                  //         print(picked.files.first.name);
                  //       }
                  //     },
                  //     elevation: 2,
                  //     fillColor: Colors.white,
                  //     child: Icon(
                  //       Icons.camera_enhance_outlined,
                  //       color: Color(0xff00a877),
                  //     ),
                  //     shape: CircleBorder(),
                  //   ),
                  // )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: bodyHeight * 0.05, horizontal: bodyWidth * 0.05),
              child: TextField(
                controller: userName,
                decoration: InputDecoration(
                  label: Text("Nama"),
                ),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: bodyHeight * 0.06,
              width: 100,
              padding: EdgeInsets.symmetric(horizontal: bodyWidth * 0.25),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(
                      0xff00a877,
                    ),
                  ),
                ),
                child: Text(
                  "Perbaharui Profile",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  // print(userName.text);
                  updateUser(userName.text);
                },
              ),
            )
          ],
        ),
      );
    }
  }
}
