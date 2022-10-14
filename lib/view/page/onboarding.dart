// ignore_for_file: prefer_const_constructors

import 'package:first_app/view/page/introScreen/intropage1.dart';
import 'package:first_app/view/page/introScreen/intropage2.dart';
import 'package:first_app/view/page/introScreen/intropage3.dart';
import 'package:first_app/view/page/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  var controller;
  PageController _controller = PageController();

  Future<http.Response> createUser(
      String uid, String name, String email, String image) {
    return http.post(
      Uri.parse('http://api-siger.uacak.com/api/v1/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "uid": uid,
        "name": name,
        "email": email,
        "image": image
      }),
    );
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        height: MediaQueryHeight,
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: const [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(height: MediaQueryHeight * 0.85),
                  Container(
                    // alignment: Alignment(
                    //   0,
                    //   0.58,
                    // ),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: ScrollingDotsEffect(
                        activeDotColor: Color(0xff14C38E),
                        activeDotScale: 2,
                        spacing: 8,
                        dotColor: Color.fromARGB(255, 202, 196, 196),
                        dotHeight: 6,
                        dotWidth: 6,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.03,
                  ),
                  SizedBox(
                    //alignment: Alignment.center,
                    width: 270,
                    height: 45,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            // backgroundColor: Colors.blue,
                            backgroundColor: Color(0xff14C38E),
                            // fixedSize: ,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {
                          if (_currentUser != null) {
                            createUser(
                                _currentUser!.id,
                                _currentUser!.displayName.toString(),
                                _currentUser!.email,
                                _currentUser!.photoUrl.toString());
                          }
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mulish-Regular',
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              ),
            ),

            // SmoothPageIndicator(controller: _controller, count: 3)
          ],
        ),
      ),
    );
  }
}
