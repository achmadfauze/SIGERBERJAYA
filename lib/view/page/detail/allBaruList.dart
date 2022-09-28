import 'package:first_app/model/baru_model.dart';
import 'package:flutter/material.dart';

class AllBaruList extends StatelessWidget {
  const AllBaruList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appbar widget on Scaffold
        title: Text("Tempat Baru"), //title aof appbar
        backgroundColor: Color(0xff00a877),
        bottom: PreferredSize(
            child: Container(
              color: Colors.orange,
              height: 0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      backgroundColor: Color.fromARGB(255, 236, 228, 228),
      body: Container(
        // margin: EdgeInsets.only(top: 8),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 0),

            // child: Container(
            child: ListView.builder(
              itemCount: itemsBaru.length,
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                height: 200,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 124,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        image: DecorationImage(
                          // image: AssetImage(itemsfestifalbudaya[index].image),
                          image: NetworkImage("${itemsBaru[index]['Image']}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.white,
                        // color: Color.fromARGB(157, 222, 238, 5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 10, right: 12, bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "${itemsBaru[index]['Name']}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Mulish-Regular',
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.black38,
                                  size: 16,
                                ),
                                Flexible(
                                  child: Text("${itemsBaru[index]['Desc']}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontFamily: 'Mulish-Regular',
                                        fontSize: 14,
                                      )),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.schedule_outlined,
                                      color: Colors.black38,
                                      size: 13,
                                    ),
                                    Text("${itemsBaru[index]['Date']}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontFamily: 'Mulish-Regular',
                                          fontSize: 14,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.black38,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text("${itemsBaru[index]['Liked']}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontFamily: 'Roboto-Regular',
                                          fontSize: 14,
                                        )),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.comment,
                                      color: Colors.black38,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text("${itemsBaru[index]['Comment']}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontFamily: 'Roboto-Regular',
                                          fontSize: 14,
                                        )),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),

              // Container(
              //     height: 200,
              //     width: double.infinity,
              //     margin: EdgeInsets.only(bottom: 8),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       image: DecorationImage(
              //         // image: AssetImage(itemsfestifalbudaya[index].image),
              //         image: NetworkImage("${itemsBaru[index]['Image']}"),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              //           Container(
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.only(
              //                   bottomLeft: Radius.circular(15),
              //                   topRight: Radius.circular(10)),
              //               color: Colors.black.withOpacity(0.5),
              //               // color: Color.fromARGB(157, 222, 238, 5)
              //             ),
              //             height: 40,
              //             width: 100,
              //             child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   const Icon(
              //                     Icons.favorite,
              //                     size: 22,
              //                     color: Colors.white,
              //                   ),
              //                   SizedBox(
              //                     width: 6,
              //                   ),
              //                   Text(
              //                     "${itemsBaru[index]['Liked']}",
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                       fontFamily: 'Roboto-Regular',
              //                       fontSize: 18,
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     width: 8,
              //                   ),
              //                   const Icon(
              //                     Icons.warning,
              //                     size: 22,
              //                     color: Colors.yellow,
              //                   ),
              //                 ]),
              //           ),
              //         ]),
              //         Container(
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.only(
              //                 bottomRight: Radius.circular(10),
              //                 bottomLeft: Radius.circular(10)),
              //             color: Colors.black.withOpacity(0.5),
              //             // color: Color.fromARGB(157, 222, 238, 5)
              //           ),
              //           height: 60,
              //           width: double.infinity,
              //           child: Padding(
              //             padding: const EdgeInsets.only(left: 12, right: 12),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "${itemsBaru[index]['Name']}",
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontFamily: 'Mulish-Regular',
              //                     fontSize: 16,
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   height: 8,
              //                 ),
              //                 Row(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     //Icon(Icons.location_on,size: 18,color: Colors.white,),
              //                     Text(
              //                       "${itemsBaru[index]['Desc']}",
              //                       maxLines: 1,
              //                       overflow: TextOverflow.ellipsis,
              //                       style: const TextStyle(
              //                         color: Colors.white,
              //                         fontFamily: 'Mulish-Regular',
              //                         fontSize: 12,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     )),
            ),
          ),
        ),
      ),
    );
  }
}
