import 'package:first_app/model/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // color: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          Image.asset(
            'assets/slide1.png',
            // height: 80,
            // width: 80,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            // "Yuk Jelajahi Wisata Lampung",
            "Explore Dan Temukan Surga Tersembunyi Di Lampung",
            style: blackTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
                height: 3,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff14C38E),
                )),
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            //TextAlign.center;
            "Akses ke informasi penting tentang\ntujun anda sebelum dan selama\nperjalanan anda",
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
