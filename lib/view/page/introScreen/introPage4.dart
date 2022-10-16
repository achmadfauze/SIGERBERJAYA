import 'package:first_app/model/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({super.key});

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
            'assets/Onboard_RS.png',
            // height: 80,
            // width: 300,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Temukan Rumah Sakit dan\nPuskesmas Terdekat",
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 3,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff14C38E),
              )),
          const SizedBox(
            height: 24,
          ),
          Text(
            //TextAlign.center;
            "Dalam kondisi darurat, jangan takut.\nAplikasi ini menyediakan informasi\ntempat rumah sakit dan puskesmas\nterdekat",
            style: regularTextStyle.copyWith(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
