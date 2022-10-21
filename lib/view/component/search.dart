import 'dart:convert';

import 'package:first_app/view/page/detail/populerdetail.dart';
import 'package:first_app/view/page/detail/populerdetailSearch.dart';
import 'package:flutter/material.dart';

// import 'package:first_app/model/API_wisata.dart';
import 'package:first_app/model/tourModel.dart';
import "package:http/http.dart" as http;

import '../../model/theme.dart';
// import 'package:first_app/model/modelAll.dart';

class SearchUser extends SearchDelegate {
  String? uid;
  SearchUser({this.uid});
  FetchSpace _List = FetchSpace();

  final List<tour> _Tour = [];

  Future<List<tour>> fetchJson({String? query}) async {
    var response = await http
        .get(Uri.parse('https://api.siger.uacak.com/public/api/v1/tour'));
    List<tour> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      for (var jsondata in urjson) {
        slist.add(tour.fromJson(jsondata));
      }
      if (query != null) {
        slist = slist
            .where((element) =>
                element.name.toLowerCase().contains((query.toLowerCase())))
            .toList();
      }
    } else {
      print("fetch error");
    }
    return slist;
  }

  // @override
  // void initState() {
  //   fetchJson().then((value) {
  //     setState(() {
  //       _Tour.addAll(value);
  //     });
  //   });
  //   super.initState();
  // }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
      child: FutureBuilder<List<tour>>(
          future: _List.fetchJson(query: query),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
              // print("");
            }
            List<tour>? data = snapshot.data;
            return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 200,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          // image: AssetImage(itemsfestifalbudaya[index].image),
                          image: NetworkImage(
                              'https://api.siger.uacak.com/public/assets/uploads/${data?[index].image}',
                              scale: 1),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              // data?[index]=data;
                              // tour temp = new tour(tourCode: tourCode, stateCode: stateCode, name: name, image: image, locationName: locationName, like: like, comment: comment, createAt: createAt, latitude: latitude, longitude: longitude, ticket: ticket, description: description)
                              return DetailPlaceSearch(
                                // data: data?[index],
                                tourCode: data?[index].tourCode,
                                uid: uid,
                              );
                            }),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(24),
                                          topRight: Radius.circular(15)),
                                      color: Color(0xff00a877),
                                      // color: Color.fromARGB(157, 222, 238, 5)
                                    ),
                                    height: 35,
                                    width: 95,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            // _Space[index].like.toString(),
                                            '${data?[index].like}',
                                            style: regularTextStyle.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
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
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                color: Colors.black.withOpacity(0.5),
                                // color: Color.fromARGB(157, 222, 238, 5)
                              ),
                              height: 60,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // _Space[index].name.toString(),
                                      '${data?[index].name.toString()}',
                                      style: regularTextStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        Flexible(
                                          child: Text(
                                            // _Space[index]
                                            //     .locationName
                                            //     .toString(),
                                            '${data?[index].locationName}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: regularTextStyle.copyWith(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
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

                  // return ListTile(
                  //   title: Row(
                  //     children: [
                  //       Container(
                  //         width: 60,
                  //         height: 60,
                  //         decoration: BoxDecoration(
                  //           color: Colors.deepPurpleAccent,
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         child: Center(
                  //           child: Text(
                  //             '${data?[index].tourCode}',
                  //             style: TextStyle(
                  //                 fontSize: 20,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.white),
                  //             overflow: TextOverflow.clip,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(width: 20),
                  //       Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               '${data?[index].name}',
                  //               style: TextStyle(
                  //                   fontSize: 18, fontWeight: FontWeight.w600),
                  //             ),
                  //             SizedBox(height: 10),
                  //             Text(
                  //               '${data?[index].email}',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ])
                  //     ],
                  //   ),
                  // );
                });
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Cari Tempat Wisata'),
    );
  }
}

class FetchSpace {
  final List<tour> _Tour = [];

  Future<List<tour>> fetchJson({String? query}) async {
    var response = await http
        .get(Uri.parse('https://api.siger.uacak.com/public/api/v1/tour'));
    List<tour> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      for (var jsondata in urjson) {
        slist.add(tour.fromJson(jsondata));
      }
      if (query != null) {
        slist = slist
            .where((element) =>
                element.name.toLowerCase().contains((query.toLowerCase())))
            .toList();
      }
    } else {
      print("fetch error");
    }
    return slist;
  }
}
