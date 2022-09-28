import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          Image.asset(
            'assets/slide2.png',
            // height: 80,
            // width: 80,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Memandu Perjalanan               \nRealtime",
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
                color: Color(0xff14C38E),
              )),
          const SizedBox(
            height: 24,
          ),
          const Text(
            //TextAlign.center;
            "Arah wisata, harga tiket, info\nperjalanan, serta semua tentang\ntempat populer di provinsi Lampung\ndalam satu aplikasi",
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
