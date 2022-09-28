import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'onboarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // color: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg_login.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Image.asset(
          //   'assets/bg_login.png',
          //   height: 200,
          //   width: 60,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 235, top: 40),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnBoardPage()));
                    },
                    child: const Text(
                      "Lewati",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto-Regular',
                        fontSize: 16,
                      ),
                    )),
                const SizedBox(
                  width: 24,
                ),
                const Icon(
                  Icons.language,
                  size: 22,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Selamat Datanggg di",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto-Regular',
                    fontSize: 20,
                  ),
                  //textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "SI SIGER BERJAYA",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto-Bold',
                    fontSize: 35,
                    // color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                  //textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 180,
                  width: 180,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  //TextAlign.center;
                  "Jelajahi setiap tempat terkenal di\nLampung dan temukan hotel\n terdekat serta restoran dengan\n cara termudah. Dapatkan petunjuk",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto-Regular',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  //TextAlign.center;
                  "arah terkini, perkiraan biaya dan\njelalahi blog perjalanan tanpa rasa\nkhawatir akan keamanan anda\nselama perjalanan.",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto-Regular',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnBoardPage()));
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
