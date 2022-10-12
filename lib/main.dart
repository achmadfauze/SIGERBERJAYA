import 'package:first_app/view/page/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:first_app/providers/space_provider.dart';
import 'package:first_app/view/component/editProfile.dart';
import 'package:first_app/view/page/login.dart';
import 'package:first_app/view/page/menu/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(FirstApp());
}

class FirstApp extends StatefulWidget {
  @override
  State<FirstApp> createState() => _FirstAppState();
}

class _FirstAppState extends State<FirstApp> {
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
    return
        // ChangeNotifierProvider(
        //   create: (context) => SpaceProvider(),
        //   child:
        MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _currentUser == null ? LoginPage() : Home(),
    );
  }
}
