import 'dart:convert';

import 'package:first_app/view/page/detail/allDetail.dart';
import 'package:first_app/view/page/detail/populerdetail.dart';
import 'package:flutter/material.dart';
import 'package:first_app/model/API_wisata.dart';
import 'package:first_app/view/component/search.dart';
// import 'package:first_app/model/modelAll.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:first_app/model/tourModel.dart';
import 'package:http/http.dart' as http;

class AllPlace extends StatefulWidget {
  String? uid;
  AllPlace({this.uid});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AllPlace> {
  // final FetchSpace _Space = FetchSpace();

  final List<tour> _Tour = [];

  Future<List<tour>> fetchJson() async {
    var response = await http
        // .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
        .get(Uri.parse('https://hiskia.xyz/api/v1/tour'));
    // print(response);
    List<tour> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      // print(urjson);
      for (var jsondata in urjson) {
        slist.add(tour.fromJson(jsondata));
      }
    }
    return slist;
  }

  @override
  void initState() {
    fetchJson().then((value) {
      setState(() {
        _Tour.addAll(value);
      });
    });
    super.initState();
  }

  void refreshData() {
    fetchJson().then((value) {
      setState(() {
        _Tour.clear();
        _Tour.addAll(value);
      });
    });
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Lampung"),
        backgroundColor: Color(0xff00a877),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchUser());
            },
            icon: Icon(Icons.search_sharp),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 12,
          left: 12,
          right: 12,
        ),
        // child: FutureBuilder<List<Space>>(
        //     // future: _Space.getspace(),
        //     builder: (context, snapshot) {
        //   var data = snapshot.data;
        child: ListView.builder(
            itemCount: _Tour.length,
            itemBuilder: (context, index) {
              // final space = _Space[index];
              // if (!snapshot.hasData) {
              //   return Center(child: CircularProgressIndicator());
              // }

              return Container(
                  height: 200,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      // image: AssetImage(itemsfestifalbudaya[index].image),
                      image: NetworkImage(_Tour[index].image.toString(),
                          scale: 1.0),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () => customAnimationWidget(
                      newPage: DetailPlace(
                        data: _Tour[index],
                        uid: widget.uid,
                      ),
                      context: context,
                      transitionBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = 0.0;
                        var end = 1.0;
                        var curve = Curves.easeIn;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return ScaleTransition(
                          scale: animation.drive(tween),
                          child: child,
                        );
                      },
                    ).then(onGoBack),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(28),
                                      topRight: Radius.circular(10)),
                                  color: Colors.black.withOpacity(0.5),
                                  // color: Color.fromARGB(157, 222, 238, 5)
                                ),
                                height: 40,
                                width: 100,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.favorite,
                                        size: 22,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        _Tour[index].like.toString(),
                                        // '${data?[index].like}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Roboto-Regular',
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.warning,
                                        size: 22,
                                        color: Colors.yellow,
                                      ),
                                    ]),
                              ),
                            ]),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
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
                                  // _Space[index].name.toString(),
                                  _Tour[index].name.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Mulish-Regular',
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      // _Space[index]
                                      //     .locationName
                                      //     .toString(),
                                      _Tour[index].locationName.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mulish-Regular',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));

              // Card(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ListTile(
              //       title: Row(
              //         children: [
              //           Container(
              //             width: 60,
              //             height: 60,
              //             decoration: BoxDecoration(
              //               color: Colors.deepPurpleAccent,
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Center(
              //               child: Text(
              //                 '${data?[index].id}',
              //                 style: TextStyle(
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.white),
              //               ),
              //             ),
              //           ),
              //           SizedBox(width: 20),
              //           Column(
              //               crossAxisAlignment:
              //                   CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   '${data?[index].name}',
              //                   style: TextStyle(
              //                       fontSize: 18,
              //                       fontWeight: FontWeight.w600),
              //                 ),
              //                 SizedBox(height: 10),
              //                 Text(
              //                   '${data?[index].email}',
              //                   style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                 ),
              //               ])
              //         ],
              //       ),
              //       // trailing: Text('More Info'),
              //     ),
              //   ),
              // );
            }),
      ),
    );
    //   ),
    // );
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:first_app/model/all_wisata.dart';
// import 'package:http/http.dart' as http;

// class AllPlace extends StatefulWidget {
//   const AllPlace({super.key});

//   @override
//   State<AllPlace> createState() => _AllPlaceState();
// }

// class _AllPlaceState extends State<AllPlace> {
//   final List<Space> _Space = [];

//   Future<List<Space>> fetchJson() async {
//     var response =
//         await http.get(Uri.parse('http://api-siger.uacak.com/api/v1/tour'));
//     print(response);
//     List<Space> slist = [];
//     if (response.statusCode == 200) {
//       var urjson = (json.decode(response.body));
//       print(urjson);
//       for (var jsondata in urjson) {
//         slist.add(Space.fromJson(jsondata));
//       }
//     }
//     return slist;
//   }

//   @override
//   void initState() {
//     fetchJson().then((value) {
//       setState(() {
//         _Space.addAll(value);
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //appbar widget on Scaffold
//         title: Text("Semua Tempat Wisata"), //title aof appbar
//         backgroundColor: Color(0xff00a877),
//       ),
//       backgroundColor: Color.fromARGB(255, 236, 228, 228),
//       body: SingleChildScrollView(
//         // margin: EdgeInsets.only(top: 8),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: TextField(
//                 scrollPadding: EdgeInsets.all(8),
//                 decoration: InputDecoration(
//                   focusColor: Color(0xff14C38E),
//                   border: OutlineInputBorder(
//                       gapPadding: 2.0,
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide:
//                           BorderSide(color: Color(0xff14C38E), width: 1)),
//                   prefixIcon: Icon(Icons.search),
//                   prefixIconColor:
//                       // Color(0xff14C38E),
//                       Colors.green,
//                   hintText: 'Cari tempat wisata',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
//               child: Container(
//                 child: ListView.builder(
//                     itemCount: _Space.length,
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       final space = _Space[index];
//                       // InkWell(
//                       //   onTap: () {
//                       //     Navigator.push(
//                       //         context,
//                       //         MaterialPageRoute(
//                       //             builder: (context) =>
//                       //                 DetailRecomendation()));
//                       //   },
//                       _listItem(index){
                      // return Container(
                      //     height: 200,
                      //     width: double.infinity,
                      //     margin: EdgeInsets.only(bottom: 8),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       image: DecorationImage(
                      //         // image: AssetImage(itemsfestifalbudaya[index].image),
                      //         image: NetworkImage(
                      //             "${itemsAll[index]['Image']}".toString(),
                      //             scale: 1),
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //     child: InkWell(
                      //       onTap: () {
                      //         // Navigator.push(
                      //         //     context,
                      //         //     MaterialPageRoute(
                      //         //         builder: (context) =>
                      //         //             DetailPlace(space: space)));
                      //       },
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Row(
                      //               mainAxisAlignment: MainAxisAlignment.end,
                      //               children: [
                      //                 Container(
                      //                   decoration: BoxDecoration(
                      //                     borderRadius: BorderRadius.only(
                      //                         bottomLeft: Radius.circular(28),
                      //                         topRight: Radius.circular(10)),
                      //                     color: Colors.black.withOpacity(0.5),
                      //                     // color: Color.fromARGB(157, 222, 238, 5)
                      //                   ),
                      //                   height: 40,
                      //                   width: 100,
                      //                   child: Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.center,
                      //                       children: [
                      //                         const Icon(
                      //                           Icons.favorite,
                      //                           size: 22,
                      //                           color: Colors.white,
                      //                         ),
                      //                         SizedBox(
                      //                           width: 6,
                      //                         ),
                      //                         Text(
                      //                           _Space[index].like.toString(),
                      //                           style: TextStyle(
                      //                             color: Colors.white,
                      //                             fontFamily: 'Roboto-Regular',
                      //                             fontSize: 18,
                      //                           ),
                      //                         ),
                      //                         SizedBox(
                      //                           width: 8,
                      //                         ),
                      //                         const Icon(
                      //                           Icons.warning,
                      //                           size: 22,
                      //                           color: Colors.yellow,
                      //                         ),
                      //                       ]),
                      //                 ),
                      //               ]),
                      //           Container(
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.only(
                      //                   bottomRight: Radius.circular(10),
                      //                   bottomLeft: Radius.circular(10)),
                      //               color: Colors.black.withOpacity(0.5),
                      //               // color: Color.fromARGB(157, 222, 238, 5)
                      //             ),
                      //             height: 60,
                      //             width: double.infinity,
                      //             child: Padding(
                      //               padding: const EdgeInsets.only(
                      //                   left: 12, right: 12),
                      //               child: Column(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Text(
                      //                     _Space[index].name.toString(),
                      //                     style: TextStyle(
                      //                       color: Colors.white,
                      //                       fontFamily: 'Mulish-Regular',
                      //                       fontSize: 16,
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     height: 8,
                      //                   ),
                      //                   Row(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       Icon(
                      //                         Icons.location_on,
                      //                         size: 16,
                      //                         color: Colors.white,
                      //                       ),
                      //                       Text(
                      //                         _Space[index]
                      //                             .locationName
                      //                             .toString(),
                      //                         maxLines: 1,
                      //                         overflow: TextOverflow.ellipsis,
                      //                         style: const TextStyle(
                      //                           color: Colors.white,
                      //                           fontFamily: 'Mulish-Regular',
                      //                           fontSize: 12,
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ));
                    //   }
                    // }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
