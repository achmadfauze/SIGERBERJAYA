import 'package:first_app/model/festivalbudayamodel.dart';
import 'package:first_app/model/popular_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FestivalBudayaList extends StatelessWidget {
  const FestivalBudayaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        // child: SizedBox(
        height: 220,
        child: ListView.builder(
          itemCount: itemsfestifalbudaya.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  // image: AssetImage(itemsfestifalbudaya[index].image),
                  image: NetworkImage("${itemsfestifalbudaya[index]['Image']}"),
                  fit: BoxFit.cover,
                ),
              ),
              height: double.infinity,
              width: 320,
              margin: EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20, left: 190),

                  //   child: ElevatedButton.icon(

                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor: Color(0xff14C38E),
                  //             shape: new RoundedRectangleBorder(
                  //               borderRadius: new BorderRadius.circular(15.0),
                  //             ),
                  //             // padding:
                  //             // EdgeInsets.symmetric(horizontal: 60, vertical: 1),
                  //         ),
                  //       onPressed: (){},
                  //       icon: Icon(
                  //         Icons.favorite,
                  //         color: Colors.white,
                  //         size: 24.0,
                  //       ),
                  //       label: Text("${itemsfestifalbudaya[index]['liked']}"),),
                  // ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: Colors.black.withOpacity(0.5),
                        // color: Color.fromARGB(157, 222, 238, 5)
                      ),
                      height: 40,
                      width: 80,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.favorite,
                              size: 22,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${itemsfestifalbudaya[index]['liked']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto-Regular',
                                fontSize: 18,
                              ),
                            ),
                            // SizedBox(width: 6,),
                            // const Icon(
                            //   Icons.warning,
                            //   size: 16,
                            //   color: Colors.yellow,
                            // ),
                          ]),
                    ),
                  ]),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      color: Colors.black.withOpacity(0.5),
                      // color: Color.fromARGB(157, 222, 238, 5)
                    ),
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${itemsfestifalbudaya[index]['Name']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mulish-Regular',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${itemsfestifalbudaya[index]['date']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mulish-Regular',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 20, left: 220, right: 30, bottom: 160
                  //   ),
                  //   child:
                  //         ElevatedButton.icon(
                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor: Color(0xff438afe),
                  //             shape: new RoundedRectangleBorder(
                  //               borderRadius: new BorderRadius.circular(15.0),
                  //             ),
                  //             // padding:
                  //             // EdgeInsets.symmetric(horizontal: 60, vertical: 1),
                  //         ),
                  //       onPressed: (){},
                  //       icon: Icon(
                  //         Icons.favorite,
                  //         color: Colors.pink,
                  //         size: 24.0,
                  //       ),
                  //       label: Text('4'),),

                  //     ),
                ],
              )),
        ),
      ),
    );
  }
}
