import 'package:first_app/model/KabupatenModel.dart';
import 'package:first_app/model/recomendationModel.dart';
import 'package:first_app/view/page/detail/kabupaten/Kabupatendetail.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Kabupaten / Kota"), //title aof appbar
            backgroundColor: Color(0xff00a877),
          ),
          // color: Color(0xffB4D6EF),
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),

                // child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllKabupatenList()));
                        },
                        child: ListView.builder(
                          itemCount: ItemsKabupaten.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                            height: 150,
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  // image: AssetImage(itemsfestifalbudaya[index].image),
                                  image: NetworkImage(
                                    "${ItemsKabupaten[index]['Image']}",
                                  ),
                                  fit: BoxFit.cover,
                                  opacity: 0.8),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Center(
                                child: Flexible(
                                  child: Text(
                                    "${ItemsKabupaten[index]['Name']}"
                                        .toUpperCase(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Mulish-Regular',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              // child: Column(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.end,
                              //         children: [
                              //           Container(
                              //             decoration: BoxDecoration(
                              //               borderRadius: BorderRadius.only(
                              //                   bottomLeft:
                              //                       Radius.circular(15),
                              //                   topRight:
                              //                       Radius.circular(10)),
                              //               color: Colors.black
                              //                   .withOpacity(0.5),
                              //               // color: Color.fromARGB(157, 222, 238, 5)
                              //             ),
                              //             height: 40,
                              //             width: 100,
                              //             child: Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.center,
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
                              //                     "${itemsRecomendation[index]['Liked']}",
                              //                     style: TextStyle(
                              //                       color: Colors.white,
                              //                       fontFamily:
                              //                           'Roboto-Regular',
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
                              //     Container(
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.only(
                              //             bottomRight: Radius.circular(10),
                              //             bottomLeft: Radius.circular(10)),
                              //         color: Colors.black.withOpacity(0.5),
                              //         // color: Color.fromARGB(157, 222, 238, 5)
                              //       ),
                              //       height: 60,
                              //       width: double.infinity,
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(
                              //             left: 12, right: 12),
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.start,
                              //           children: [
                              //             Text(
                              //               "${itemsRecomendation[index]['Name']}",
                              //               style: TextStyle(
                              //                 color: Colors.white,
                              //                 fontFamily: 'Mulish-Regular',
                              //                 fontSize: 16,
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 8,
                              //             ),
                              //             Row(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 //Icon(Icons.location_on,size: 18,color: Colors.white,),
                              //                 Text(
                              //                   "${itemsRecomendation[index]['Address']}",
                              //                   maxLines: 1,
                              //                   overflow:
                              //                       TextOverflow.ellipsis,
                              //                   style: const TextStyle(
                              //                     color: Colors.white,
                              //                     fontFamily:
                              //                         'Mulish-Regular',
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // )),
                            ),
                          ),
                        ),
                      ))
                    ]),
              ),
            ),
          )),
    );
  }
}
