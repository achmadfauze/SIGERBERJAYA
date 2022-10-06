import 'package:first_app/view/component/Emergency.dart';
import 'package:provider/provider.dart';
import 'package:first_app/providers/space_provider.dart';
import 'package:first_app/view/component/editProfile.dart';
import 'package:first_app/view/page/login.dart';
import 'package:first_app/view/page/menu/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider(
        //   create: (context) => SpaceProvider(),
        //   child:
        MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
