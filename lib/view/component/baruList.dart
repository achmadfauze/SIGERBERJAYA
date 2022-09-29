import 'package:first_app/model/baru_model.dart';
import 'package:first_app/view/component/detailTempat.dart';
import 'package:flutter/material.dart';

class BaruList extends StatelessWidget {
  const BaruList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SizedBox(
            height: 220,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailTempat()));
              },
              child: ListView.builder(
                itemCount: itemsBaru.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage("${itemsBaru[index]['Image']}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: double.infinity,
                    width: 130,
                    margin: EdgeInsets.only(left: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  color: Colors.black.withOpacity(0.5),
                                  // color: Color.fromARGB(157, 222, 238, 5)
                                ),
                                height: 28,
                                width: 70,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.favorite,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Mulish-Regular',
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      const Icon(
                                        Icons.warning,
                                        size: 16,
                                        color: Colors.yellow,
                                      ),
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
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 10, bottom: 10),
                            child: Text(
                              "${itemsBaru[index]['Name']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Mulish-Regular',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.only(
                          //         bottomRight: Radius.circular(15),
                          //         bottomLeft: Radius.circular(15)),
                          //     color: Colors.black.withOpacity(0.5),
                          //     // color: Color.fromARGB(157, 222, 238, 5)
                          //   ),
                          //   height: 80,
                          //   width: double.infinity,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 12, right: 12),
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           "${itemsBaru[index]['Name']}",
                          //           style: TextStyle(
                          //             color: Colors.white,
                          //             fontFamily: 'Mulish-Regular',
                          //             fontSize: 16,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),

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
                        )
                      ],
                    )

                    // Padding(
                    //   padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
                    //   child: Text(
                    //     //textAlign: TextAlign.justify,
                    //     // maxLines: 2,
                    //     // overflow: TextOverflow.ellipsis,
                    //     // itemsBaru[index].name,
                    //     "${itemsBaru[index]['Name']}",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 16,
                    //         fontFamily: 'Mulish-Regular'),
                    //   ),
                    // ),
                    ),
              ),
            ),
          ),
        ));
  }
}
