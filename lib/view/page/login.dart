import 'package:first_app/main.dart';
import 'package:first_app/model/theme.dart';
import 'package:first_app/view/page/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'onboarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnBoardPage()));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // color: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // opacity: 20,
                image: AssetImage(
                  "assets/backgroundfix.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              // color: Colors.amber.withOpacity(0.1),
            ),
          ),
          // Image.asset(
          //   'assets/bg_login.png',
          //   height: 200,
          //   width: 60,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnBoardPage()));
                    },
                    child: Text("Lewati",
                        style: whiteTextStyle.copyWith(fontSize: 16))),
                const SizedBox(
                  width: 24,
                ),
                // const Icon(
                //   Icons.language,
                //   size: 22,
                //   color: Colors.white,
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Selamat Datang di",
                  style: whiteTextStyle.copyWith(fontSize: 20),
                  // color: Colors.white,
                  // fontFamily: 'Roboto-Regular',
                  // fontSize: 20,

                  //textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("PARIWISATA BERJAYA",
                    style: whiteTextStyle.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      // color: Color(0xff14C38E),
                    )
                    // TextStyle(
                    //   color: Colors.white,
                    //   fontFamily: 'Roboto-Bold',
                    //   fontSize: 35,
                    //   // color: Colors.white,
                    //   fontWeight: FontWeight.w900,
                    // ),
                    //textAlign: TextAlign.center,
                    ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/logo_lampung.gif',
                      // height: 200,
                      width: 260,
                    ),
                  ),
                  decoration: BoxDecoration(
                      // color: Color(0xff14C38E).withOpacity(0.2),
                      // color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(40)),
                ),
                const SizedBox(
                  height: 15,
                ),
                // const SizedBox(
                //   height: 22,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        //TextAlign.center;
                        "Jelajahi setiap tempat terkenal di\nLampung dan temukan hotel\n terdekat serta restoran dengan\n cara termudah. Dapatkan petunjuk",
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, wordSpacing: 1, height: 1.3),

                        textAlign: TextAlign.center,
                      ),
                      Text(
                        //TextAlign.center;
                        "arah terkini, perkiraan biaya dan\njelalahi blog perjalanan tanpa rasa\nkhawatir akan keamanan anda\nselama perjalanan.",
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                        ),

                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      height: 3,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff14C38E),
                      )),
                ),
                // const SizedBox(
                //   height: 100,
                // ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff14C38E),
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 1),
                          ),
                          // icon: Icon(Icons.language),
                          icon: const Text(
                            "G",
                            style: TextStyle(
                                fontFamily: 'RedHat',
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          label: const Text(
                            "Sign In With Google",
                            style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 16,
                            ),
                          ),
                          // onPressed: () async {
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) => Home()));
                          onPressed: () async {
                            await _handleSignIn();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
