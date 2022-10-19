import 'dart:ffi';

import 'package:first_app/view/component/comment.dart';
import 'package:first_app/view/component/popular%20List.dart';
import 'package:first_app/view/page/menu/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

// import '../../../model/popular_model.dart';
import '../../../model/tourModel.dart';
import '../../component/listLayanan.dart';
import 'package:first_app/model/theme.dart';
import 'package:first_app/widget/facility_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailPlace extends StatefulWidget {
  String? tourCode, uid;
  tour? data;

  // final TourPop? adata;
  DetailPlace({
    super.key,
    this.tourCode,
    this.data,
    this.uid,
  });

  // final Space space;

  // // final Space space;
  // DetailPlace({
  //   Key? key,
  //   required this.space,
  //   // required Space space,
  // }) : super(key: key);

  // DetailPlace(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPlace> {
  bool isFavorite = false;
  bool isArchive = false;
  int like = 0;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;

  Future<int> getILike() async {
    int islike = 0;
    // print("asdsad");

    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/isliketour/${widget.data!.tourCode}/${widget.uid}'));
    // print(response);
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      // print(int.parse(urjson.toString()));
      islike = int.parse(urjson.toString());
    }

    return islike;
  }

  Future<int> getArchive() async {
    int isarchive = 0;
    // print("asdsad");

    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/isarchivetour/${widget.data!.tourCode}/${widget.uid}'));
    // print(response);
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      // print(int.parse(urjson.toString()));
      isarchive = int.parse(urjson.toString());
    }

    return isarchive;
  }

  Future<String> likeHandler() async {
    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/liketour/${widget.data!.tourCode}/${widget.uid}'));
    // print(response);
    return (response.statusCode.toString());
  }

  Future<String> dislikeHandler() async {
    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/disliketour/${widget.data!.tourCode}/${widget.uid}'));
    // print(response);
    return (response.statusCode.toString());
  }

  Future<String> archiveHandler() async {
    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/archive_tour/${widget.data!.tourCode}/${widget.uid}'));

    return (response.statusCode.toString());
  }

  Future<String> unarchiveHandler() async {
    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/unarchivetour/${widget.data!.tourCode}/${widget.uid}'));

    return (response.statusCode.toString());
  }

  @override
  void initState() {
    // TODO: implement initState

    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    getILike().then(
      (value) {
        // print(value);
        setState(() {
          if (value > 0) {
            isFavorite = true;
          }
        });
      },
    );
    getArchive().then(
      (value) {
        // print(value);
        setState(() {
          if (value > 0) {
            isArchive = true;
          }
        });
      },
    );
    setState(() {
      like = int.parse(widget.data!.like);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.data!.image,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      // NOTE: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data!.name,
                              style: blackTextStyle.copyWith(
                                fontSize: 22,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.data!.ticket,
                                    style: greyTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        size: 22,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        // widget.space.like.toString(),
                                        like.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Roboto-Regular',
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(
                                          //     builder: ((context) => Comment(
                                          //           uid: widget.uid,
                                          //           tourCode:
                                          //               widget.data!.tourCode,
                                          //         )),
                                          //   ),
                                          // );
                                        },
                                        child: Icon(
                                          Icons.comment,
                                          size: 22,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        widget.data!.comment.toString(),
                                        // widget.space.like.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Roboto-Regular',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: edge,
                      ),
                      // NOTE: MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.only(left: edge, right: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.check_box,
                                    size: 18,
                                    color: Colors.green,
                                  )),
                                  WidgetSpan(
                                    child: Text(
                                      " Wisata Buka",
                                      maxLines: 1,
                                      style: regularTextStyle.copyWith(
                                          fontSize: 14,
                                          color: Colors.green[800]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.traffic,
                                  color: Colors.green,
                                  size: 18,
                                )),
                                WidgetSpan(
                                  child: Text(
                                    " Lancar",
                                    style: regularTextStyle.copyWith(
                                        fontSize: 14, color: Colors.green[800]),
                                  ),
                                ),
                              ],
                            )),
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.warning,
                                      size: 18,
                                      color: Colors.green,
                                    ),
                                  ),
                                  WidgetSpan(
                                      child: Text(
                                    "Aman Dari Covid",
                                    style: regularTextStyle.copyWith(
                                        fontSize: 14, color: Colors.green[800]),
                                  ))
                                ],
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: edge,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: edge, right: edge, bottom: edge),
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            // '${widget.space.description}',
                            widget.data!.description,
                            // "Contented get distrusts certainty nay are frankness concealed ham. On unaffected resolution on considered of. No thought me husband or colonel forming effects. End sitting shewing who saw besides son musical adapted. Contrasted interested eat alteration pianoforte sympathize was. He families believed if no elegance interest surprise an. It abode wrong miles an so delay plate. She relation own put outlived may disposed. ",
                            style: regularTextStyle.copyWith(fontSize: 14),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: edge, bottom: 10),
                        child: Text(
                          'Lokasi Wisata',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                widget.data!.locationName,
                                // '${widget.space.locationName}',
                                style: greyTextStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            InkWell(
                              onTap: () => MapsLauncher.launchCoordinates(
                                double.parse(widget.data!.latitude),
                                double.parse(widget.data!.longitude),
                                widget.data!.name.toString(),
                              ),
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: edge,
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Fasilitas Terdekat',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return ListLayanan(
                                          Judul: "Kepolisian Terdekat",
                                          url:
                                              "https://hiskia.xyz/api/v1/police/${widget.data!.stateCode}",
                                        );
                                      }),
                                    );
                                  }),
                                  child: Image.asset(
                                    'assets/icon_police.png',
                                    // 'assets/icon_kitchen.png',
                                    width: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text.rich(
                                  // TextSpan(
                                  //   text: '$total',
                                  //   style: purpleTextStyle.copyWith(
                                  //     fontSize: 14,
                                  //   ),
                                  //   children: [
                                  TextSpan(
                                    text: 'Kepolisian',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return ListLayanan(
                                          Judul: "Restoran Terdekat",
                                          url:
                                              "https://hiskia.xyz/api/v1/restaurant/${widget.data!.stateCode}",
                                        );
                                      }),
                                    );
                                  }),
                                  child: Image.asset(
                                    'assets/icon_kitchen.png',
                                    width: 32,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text.rich(
                                  // TextSpan(
                                  //   text: '$total',
                                  //   style: purpleTextStyle.copyWith(
                                  //     fontSize: 14,
                                  //   ),
                                  //   children: [
                                  TextSpan(
                                    text: 'Restoran',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return ListLayanan(
                                          Judul: "Rumah Sakit Terdekat",
                                          url:
                                              "https://hiskia.xyz/api/v1/medicalfacility/${widget.data!.stateCode}",
                                        );
                                      }),
                                    );
                                  }),
                                  child: Image.asset(
                                    'assets/icon_hospital.png',
                                    // 'assets/icon_kitchen.png',
                                    width: 32,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text.rich(
                                  // TextSpan(
                                  //   text: '$total',
                                  //   style: purpleTextStyle.copyWith(
                                  //     fontSize: 14,
                                  //   ),
                                  //   children: [
                                  TextSpan(
                                    text: 'Rumah Sakit',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return ListLayanan(
                                          Judul: "Hotel Terdekat",
                                          url:
                                              "https://hiskia.xyz/api/v1/hotel/${widget.data!.stateCode}",
                                        );
                                      }),
                                    );
                                  }),
                                  child: Image.asset(
                                    'assets/icon_bedroom.png',
                                    width: 36,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text.rich(
                                  // TextSpan(
                                  //   text: '$total',
                                  //   style: purpleTextStyle.copyWith(
                                  //     fontSize: 14,
                                  //   ),
                                  //   children: [
                                  TextSpan(
                                    text: 'Hotel',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),

                            // FacilityItem(
                            //   name: 'Kepolisian',
                            //   imageUrl: 'assets/icon_kitchen.png',

                            //   // total: widget.space.numberOfKitchens,
                            // ),
                            // FacilityItem(
                            //   name: 'Rumah Sakit',
                            //   imageUrl: 'assets/icon_bedroom.png',
                            //   // total: widget.space.numberOfBedrooms,
                            // ),
                            // FacilityItem(
                            //   name: 'Restoran',
                            //   imageUrl: 'assets/icon_cupboard.png',
                            //   // total: widget.space.numberOfCupboards,
                            // ),
                            // FacilityItem(
                            //   name: 'Hotel',
                            //   imageUrl: 'assets/icon_cupboard.png',
                            //   // total: widget.space.numberOfCupboards,
                            // ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      // NOTE: PHOTO
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Mungkin anda juga suka',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      // Container(
                      //   height: 88,
                      //   child: ListView(
                      //     scrollDirection: Axis.horizontal,
                      //     children: widget.space.image.map((item) {
                      //       return Container(
                      //         margin: EdgeInsets.only(
                      //           left: 24,
                      //         ),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(16),
                      //           child: Image.network(
                      //             item,
                      //             width: 110,
                      //             height: 88,
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      // NOTE: LOCATION

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 220,
                        child: PageView(
                          children: <Widget>[
                            PopularList(),
                          ],
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(
                      //     horizontal: edge,
                      //   ),
                      //   height: 50,
                      //   width: MediaQuery.of(context).size.width - (2 * edge),
                      //   child: TextButton(
                      //     onPressed: () {
                      //       handleBook(widget.space);
                      //     },
                      //     style: TextButton.styleFrom(
                      //       foregroundColor: purpleColor,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(17),
                      //       ),
                      //     ),
                      //     child: Text(
                      //       'Book Now',
                      //       style: whiteTextStyle.copyWith(
                      //         fontSize: 18,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  // Image.asset(
                  //   'assets/btn_wishlist.png',
                  //   width: 40,
                  // ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (_currentUser != null) {
                              if (isFavorite == false) {
                                likeHandler().then((value) {
                                  if (value == "200") {
                                    setState(() {
                                      like++;
                                    });
                                  }
                                });
                              } else {
                                dislikeHandler().then(
                                  (value) {
                                    if (value == "200") {
                                      setState(() {
                                        like--;
                                      });
                                    }
                                  },
                                );
                              }
                              isFavorite = !isFavorite;
                            }
                          });
                        },
                        child: Image.asset(
                          isFavorite
                              ? 'assets/btn_wishlist_active.png'
                              : 'assets/btn_wishlist.png',
                          width: 40,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => Comment(
                                    uid: widget.uid,
                                    tourCode: widget.data!.tourCode,
                                  )),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/btn_comment.png',
                          width: 40,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (_currentUser != null) {
                              if (isArchive == false) {
                                archiveHandler().then((value) {
                                  if (value == "200") {
                                    setState(() {});
                                  }
                                });
                              } else {
                                unarchiveHandler().then(
                                  (value) {
                                    if (value == "200") {
                                      setState(() {});
                                    }
                                  },
                                );
                              }
                              isArchive = !isArchive;
                            }
                          });
                        },
                        child: Image.asset(
                          isArchive
                              ? 'assets/btn_archive_active.png'
                              : 'assets/btn_archive.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DetailPlace extends StatefulWidget {
//   // const DetailPlace({super.key});

//   final Space space;
//   DetailPlace({
//     Key? key,
//     required this.space,
//     // required Space space,
//   }) : super(key: key);

//   @override
//   State<DetailPlace> createState() => _DetailPlaceState();
// }

// class _DetailPlaceState extends State<DetailPlace> {
//   final controller = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     final myAppBar = ScrollAppBar(
//       elevation: 0,
//       actions: [
//         Icon(
//           Icons.favorite_border,
//           size: 24,
//         ),
//         SizedBox(
//           width: 8,
//         ),
//         Icon(
//           Icons.bookmark_border,
//           size: 24,
//         ),
//         SizedBox(
//           width: 16,
//         ),
//       ],
//       controller: controller,
//       backgroundColor: Colors.transparent,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(0),
//           bottomRight: Radius.circular(0),
//         ),
//       ),
//       flexibleSpace: ClipRRect(
//         // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(
//                 "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg",
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20)),
//                   color: Colors.white,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 12, top: 10),
//                   child: Text(
//                     widget.space.name.toString(),
//                     style: TextStyle(
//                         fontFamily: 'Roboto-Regular',
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//     return Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(250),
//           child: myAppBar,
//         ),
//         body: Container(
//             child: ListView(
//           controller: controller,
//           children: [
//             // SizedBox(
//             //   height: 300,
//             // ),
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Flexible(
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.place,
//                                 size: 16,
//                                 color: Colors.black,
//                               ),
//                               Flexible(
//                                 child: Text(
//                                   widget.space.locationName.toString(),
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto-Regular',
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.favorite,
//                               size: 22,
//                               color: Colors.amber,
//                             ),
//                             SizedBox(
//                               width: 4,
//                             ),
//                             Text(
//                               widget.space.like.toString(),
//                               style: TextStyle(
//                                 fontFamily: 'Roboto-Regular',
//                                 fontSize: 18,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Icon(
//                               Icons.comment,
//                               size: 22,
//                               color: Colors.green,
//                             ),
//                             SizedBox(
//                               width: 4,
//                             ),
//                             Text(
//                               widget.space.like.toString(),
//                               style: TextStyle(
//                                 fontFamily: 'Roboto-Regular',
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 12, top: 10, right: 16),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 6,
//                               child: Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     WidgetSpan(
//                                         child: Icon(
//                                       Icons.favorite,
//                                       size: 18,
//                                     )),
//                                     WidgetSpan(
//                                       child: Text(" 20 Orang Menyukai ini",
//                                           maxLines: 1,
//                                           style: TextStyle(fontSize: 16)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     WidgetSpan(
//                                         child: Icon(
//                                       Icons.comment,
//                                       size: 18,
//                                     )),
//                                     TextSpan(
//                                         text: " 50",
//                                         style: TextStyle(fontSize: 16)),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 4,
//                               child: Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     WidgetSpan(
//                                         child: Icon(
//                                       Icons.check_box,
//                                       size: 18,
//                                       color: Colors.green,
//                                     )),
//                                     WidgetSpan(
//                                       child: Text(
//                                         " Wisata Buka",
//                                         maxLines: 1,
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             color: Colors.green[800]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 4,
//                               child: Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     WidgetSpan(
//                                         child: Icon(
//                                       Icons.money,
//                                       size: 18,
//                                     )),
//                                     WidgetSpan(
//                                       child: Text(" Rp. 0",
//                                           maxLines: 1,
//                                           style: TextStyle(fontSize: 16)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 4,
//                               child: Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     WidgetSpan(
//                                         child: Icon(
//                                       Icons.traffic,
//                                       color: Colors.green,
//                                       size: 18,
//                                     )),
//                                     WidgetSpan(
//                                       child: Text(
//                                         " Lancar",
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             color: Colors.green[800]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 7,
//                               child: Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     WidgetSpan(
//                                         child: Icon(
//                                       Icons.people,
//                                       size: 18,
//                                       color: Colors.green,
//                                     )),
//                                     WidgetSpan(
//                                       child: Text(
//                                         " 100 Orang Saat Ini",
//                                         maxLines: 1,
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             color: Colors.green[800]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Text.rich(
//                               TextSpan(
//                                 children: [
//                                   WidgetSpan(
//                                     child: Icon(
//                                       Icons.warning,
//                                       size: 18,
//                                       color: Colors.green,
//                                     ),
//                                   ),
//                                   WidgetSpan(
//                                       child: Text(
//                                     "Aman Dari Covid",
//                                     style: TextStyle(
//                                         color: Colors.green[800], fontSize: 16),
//                                   ))
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: 15),
//                           child: Text(
//                             "Contented get distrusts certainty nay are frankness concealed ham. On unaffected resolution on considered of. No thought me husband or colonel forming effects. End sitting shewing who saw besides son musical adapted. Contrasted interested eat alteration pianoforte sympathize was. He families believed if no elegance interest surprise an. It abode wrong miles an so delay plate. She relation own put outlived may disposed. ",
//                             style: TextStyle(fontSize: 18, height: 1.5),
//                             textAlign: TextAlign.justify,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: Card(
//                       elevation: 3,
//                       margin: EdgeInsets.only(top: 15, bottom: 15),
//                       child: Container(
//                         margin: EdgeInsets.all(8),
//                         child: Column(
//                           children: [
//                             Text(
//                               "Informasi Kepolisian Terdekat",
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: SizedBox(
//                                     child: Image.network(
//                                       "https://upload.wikimedia.org/wikipedia/commons/6/6e/Lambang_Polri.png",
//                                       fit: BoxFit.fitHeight,
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                     flex: 7,
//                                     child: Container(
//                                       margin: EdgeInsets.only(
//                                           left: 15, bottom: 15, top: 8),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "POLRES Lampung Tengah",
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           RichText(
//                                             text: TextSpan(children: [
//                                               WidgetSpan(
//                                                 child: Icon(
//                                                   Icons.person_pin_outlined,
//                                                   color: Colors.green,
//                                                   size: 18,
//                                                 ),
//                                               ),
//                                               WidgetSpan(
//                                                   child: Text(
//                                                       "BRIPKA Lukman Nulhakim"))
//                                             ]),
//                                           ),
//                                           RichText(
//                                             text: TextSpan(children: [
//                                               WidgetSpan(
//                                                 child: Icon(
//                                                   Icons.phone,
//                                                   size: 18,
//                                                   color: Colors.blue,
//                                                 ),
//                                               ),
//                                               WidgetSpan(
//                                                   child: Text("085378753209"))
//                                             ]),
//                                           ),
//                                           Row(children: [
//                                             Expanded(
//                                               flex: 1,
//                                               child: Icon(
//                                                 Icons.place,
//                                                 size: 18,
//                                                 color: Colors.red,
//                                               ),
//                                             ),
//                                             Expanded(
//                                                 flex: 12,
//                                                 child: Text(
//                                                     "Jl.Negara No.1 Gn.Sugihm Kec. Gn.Sugih, Kabupaten Lampung Tengah"))
//                                           ]),
//                                         ],
//                                       ),
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: Card(
//                       elevation: 3,
//                       margin: EdgeInsets.only(top: 15, bottom: 15),
//                       child: Container(
//                         margin: EdgeInsets.all(8),
//                         child: Column(
//                           children: [
//                             Text(
//                               "Informasi Kondisi Wisata",
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                     child: Container(
//                                   margin: EdgeInsets.only(
//                                       left: 15, bottom: 15, top: 8),
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Saat ini Objek Wisata dalam situasi normal",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ))
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: Card(
//                       elevation: 3,
//                       margin: EdgeInsets.only(top: 15, bottom: 15),
//                       child: Container(
//                         margin: EdgeInsets.all(8),
//                         child: Column(
//                           children: [
//                             Text(
//                               "Informasi Jalur Akses Wisata",
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                     child: Container(
//                                   margin: EdgeInsets.only(
//                                       left: 15, bottom: 15, top: 8),
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Akses menuju objek aman, kondisi trafik lancar",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ))
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: Card(
//                       elevation: 3,
//                       margin: EdgeInsets.only(top: 15, bottom: 15),
//                       child: Container(
//                         margin: EdgeInsets.all(8),
//                         child: Column(
//                           children: [
//                             Text(
//                               "Informasi Protokol Kesehatan",
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                     child: Container(
//                                   margin: EdgeInsets.only(left: 15, top: 8),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Protokol Kesehatan diterapkan, masyarakat wajib menggunakan masker",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       TextButton(
//                                         onPressed: (() => launchUrl(
//                                             Uri.parse('https://covid19.go.id/'),
//                                             mode: LaunchMode
//                                                 .externalNonBrowserApplication)),
//                                         child: Text(
//                                           "For More Covid-19 information",
//                                           style: TextStyle(color: Colors.white),
//                                         ),
//                                         style: ButtonStyle(
//                                             backgroundColor:
//                                                 MaterialStateProperty.all(
//                                                     Colors.amber)),
//                                       )
//                                     ],
//                                   ),
//                                 ))
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(bottom: 20),
//                           child: Text(
//                             "Layanan",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(bottom: 30),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (() {
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(builder: (context) {
//                                         return ListLayanan(
//                                           Judul: "Kepolisian",
//                                         );
//                                       }),
//                                     );
//                                   }),
//                                   child: Column(
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 30,
//                                         backgroundColor: Colors.amber,
//                                         backgroundImage: AssetImage(
//                                           ("assets/icons8-policeman-64.png"),
//                                         ),
//                                       ),
//                                       Text("Kepolisian"),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (() {
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(builder: (context) {
//                                         return ListLayanan(
//                                           Judul: "Fasilitas Kesehatan",
//                                         );
//                                       }),
//                                     );
//                                   }),
//                                   child: Column(
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 30,
//                                         backgroundColor: Colors.amber,
//                                         backgroundImage: AssetImage(
//                                           "assets/icons8-facilities-64.png",
//                                         ),
//                                       ),
//                                       Text("Fasilitas Kesehatan"),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   children: [
//                                     CircleAvatar(
//                                       radius: 30,
//                                       backgroundColor: Colors.amber,
//                                       backgroundImage: AssetImage(
//                                         "assets/icons8-tour-guide-64.png",
//                                       ),
//                                     ),
//                                     Text("Pemandu Wisata"),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(bottom: 30),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (() {
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(builder: (context) {
//                                         return ListLayanan(
//                                           Judul: "Hotel Terdekat",
//                                         );
//                                       }),
//                                     );
//                                   }),
//                                   child: Column(
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 30,
//                                         backgroundColor: Colors.amber,
//                                         backgroundImage: AssetImage(
//                                           "assets/icons8-hotel-48.png",
//                                         ),
//                                       ),
//                                       Text("Hotel Terdekat")
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (() {
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(builder: (context) {
//                                         return ListLayanan(
//                                           Judul: "Restoran",
//                                         );
//                                       }),
//                                     );
//                                   }),
//                                   child: Column(
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 30,
//                                         backgroundColor: Colors.amber,
//                                         backgroundImage: AssetImage(
//                                           "assets/icons8-restaurant-48.png",
//                                         ),
//                                       ),
//                                       Text("Restoran"),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   child: Column(
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 30,
//                                         backgroundColor: Colors.amber,
//                                         backgroundImage: AssetImage(
//                                           "assets/icons8-review-64.png",
//                                         ),
//                                       ),
//                                       Text("Ulasan"),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(bottom: 30),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: GestureDetector(
//                                   child: Column(
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 30,
//                                         backgroundColor: Colors.amber,
//                                         backgroundImage: AssetImage(
//                                           "assets/icons8-news-60.png",
//                                         ),
//                                       ),
//                                       Text("Berita"),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
//                     child: Column(
//                       children: [
//                         Text(
//                           "Anda mungkin juga suka",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(vertical: 20),
//                           height: 220,
//                           child: PageView(
//                             children: <Widget>[
//                               PopularList(),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         )));
//   }
// }
