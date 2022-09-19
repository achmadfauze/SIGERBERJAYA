import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SIGER BERJAYA',
                    style: TextStyle(
                      fontFamily: 'Mulish-Bold',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Jelajahi Lampung',
                    style: TextStyle(
                      fontFamily: 'Mulish-Regular',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              // Container(
              //   height: 50,
              //   width: 50,
              //   child: Image.asset('assets/icons/icon8-user-24.png'),

              //   // decoration: BoxDecoration(
              //   //   borderRadius: BorderRadius.circular(10),
              //   //   color: Colors.grey,
              // ),
              //   ,
              //   iconSize: 40,c onPressed: () {}),
              // ),
              // IconButton( icon: Image.asset('email',)
              // ,
              // iconSize: 40,c onPressed: () {}),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Container(
              //       child: Image.asset('assets/icons/icon8-user-24.png'),
              //       height: 50,
              //       width: 50,
              //       color: Colors.black,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       // ,
              //       // iconSize: 40,c onPressed: () {}),
              //     ),
              //     // IconButton( icon: Image.asset('email',)
              //     // ,
              //     // iconSize: 40,c onPressed: () {}),
              //   ],
              // )
              // IconButton(onPressed: (){}), icon: 'assets/icons/icons8-user-24.png'),
            ]),
          ],
        ));
  }
}
