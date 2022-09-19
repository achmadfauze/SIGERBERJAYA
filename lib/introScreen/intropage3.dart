import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // child: Container(
      // padding: const EdgeInsets.only(top: 70),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          Image.asset(
            'assets/slide3.png',
            // height: 80,
            // width: 80,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Temukan Kantor Polisi             \nTerdekat",
            style: TextStyle(
              fontFamily: 'Mulish-Bold',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 3,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff438afe),
              )),
          const SizedBox(
            height: 24,
          ),
          const Text(
            //TextAlign.center;
            "Dalam kondisi darurat, jangan takut.\nAplikasi ini menyediakan informasi\ntempat kepolisian terdekat",
            style: TextStyle(
              fontFamily: 'Mulish-Regular',
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
