import 'dart:convert';

// import 'package:first_app/model/recomendationModel.dart';
import 'package:first_app/model/tourModel.dart';
import 'package:first_app/model/userModel.dart';
// import 'package:first_app/view/component/BaruList.dart';
import 'package:first_app/view/component/Emergency.dart';
import 'package:first_app/view/component/all_place.dart';
import 'package:first_app/view/component/baruList.dart';
import 'package:first_app/view/component/carousel.dart';
// import 'package:first_app/view/component/detailRecomendation.dart';
// import 'package:first_app/view/component/detailTempat.dart';
// import 'package:first_app/view/component/festivalBudayaList.dart';
import 'package:first_app/view/component/pdfviewer.dart';
import 'package:first_app/view/component/popular%20List.dart';
// import 'package:first_app/view/component/search.dart';
// import 'package:first_app/view/component/test.dart';
// import 'package:first_app/view/page/detail/allBaruList.dart';
// import 'package:first_app/view/page/detail/allPopularList.dart';
import 'package:first_app/view/page/detail/allRecomendation.dart';
import 'package:first_app/view/page/detail/populerdetail.dart';
import 'package:first_app/view/page/detail/recomendation_detail.dart';
import 'package:first_app/view/component/search.dart';
// import 'package:first_app/view/page/menu/profilPage.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../../model/theme.dart';

// import '../detail/populerdetail.dart';

class HomePage extends StatefulWidget {
  String? uid, img;
  HomePage({this.uid, this.img});
  @override
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<HomePage> {
  final List<tour> _Tour = [];
  late bool _isLoading;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;

  Future<List<tour>> fetchJson() async {
    var response = await http
        // .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
        .get(Uri.parse('https://hiskia.xyz/public/api/v1/recomendedtour/5'));
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

  user Users = new user();
  Future<user> getUser() async {
    var response = await http
        .get(Uri.parse('https://hiskia.xyz/api/v1/user/${widget.uid}'));

    user slist = new user();
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      // print(urjson['name']);
      slist = user(
          userCode: urjson['userCode'],
          uid: urjson['uid'],
          email: urjson['email'],
          image: urjson['image'],
          name: urjson['name'],
          createAt: urjson['createAt']);
    }

    return slist;
  }

  @override
  void initState() {
    _isLoading = true;
    fetchJson().then((value) {
      setState(() {
        _isLoading = false;
        _Tour.addAll(value);
      });
    });
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  void refreshData() {
    fetchJson().then((value) {
      setState(() {
        _Tour.clear();
        _Tour.addAll(value);
      });
    });
    PopularList(
      uid: _currentUser != null ? _currentUser!.id.toString() : null,
    );
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SIGER BERJAYA",
                              style: blackTextStyle.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Jelajahi Lampung",
                              style: regularTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  primary: Colors.black),
                              child: Container(
                                  width: 45,
                                  height: 45,
                                  // alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.coronavirus,
                                    size: 34,
                                    color: Colors.yellow,
                                  )),
                              // onPressed: () {},
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PdfView()));
                                // builder: (context) => PdfView()));
                              },
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                //color: Colors.green,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(widget.img.toString()),
                                ),
                              ),
                            )
                          ],
                        ),
                        // Icon(
                        //   Icons.east,
                        //   size: 30,
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          showSearch(
                              context: context,
                              delegate: SearchUser(uid: widget.uid));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => AllPlace()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey.withOpacity(0.3)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.search,
                                size: 26,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Cari tempat Wisata",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: "Roboto-Regular",
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )

                      // TextField(
                      //   scrollPadding: EdgeInsets.all(8),
                      //   decoration: InputDecoration(
                      //     focusColor: Color(0xff14C38E),
                      //     border: OutlineInputBorder(
                      //         gapPadding: 2.0,
                      //         borderRadius: BorderRadius.circular(8),
                      //         borderSide:
                      //             BorderSide(color: Color(0xff14C38E), width: 1)),
                      //     prefixIcon: Icon(Icons.search),
                      //     prefixIconColor: Color(0xff14C38E),
                      //     hintText: 'Cari tempat wisata',
                      //   ),
                      // ),
                      ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 240,
                    child: PageView(
                      children: <Widget>[
                        Carousel(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // Container(
                  //   child: DefaultTabController(
                  //     length: 2,
                  //     child: Column(
                  //       children: <Widget>[
                  //         ButtonsTabBar(
                  //           backgroundColor: Colors.red,
                  //           unselectedBackgroundColor: Colors.grey[300],
                  //           unselectedLabelStyle:
                  //               TextStyle(color: Colors.black),
                  //           labelStyle: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold),
                  //           tabs: [
                  //             Tab(
                  //               icon: Icon(Icons.directions_car),
                  //               text: "Populer",
                  //             ),
                  //             Tab(
                  //               icon: Icon(Icons.directions_transit),
                  //               text: "Terbaru",
                  //             ),
                  //           ],
                  //         ),
                  //         Container(
                  //           child: TabBarView(
                  //             children: <Widget>[
                  //               PageView(
                  //                 children: <Widget>[
                  //                   PopularList(),
                  //                 ],
                  //               ),
                  //               PageView(
                  //                 children: <Widget>[
                  //                   BaruList(),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 4, top: 0, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Tempat Terpopuler",
                              style: regularTextStyle.copyWith(fontSize: 18),
                            ),
                            InkWell(
                              child: Text(
                                "Lihat semua >>",
                                style: regularTextStyle.copyWith(
                                    fontSize: 14, color: Color(0xff00a877)),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllPlace(
                                              uid: widget.uid.toString(),
                                            ))).then(onGoBack);
                              },
                            ),
                            // Container(
                            //   child: ElevatedButton.icon(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor: Colors.white,
                            //     padding:
                            //         EdgeInsets.symmetric(horizontal: 60, vertical: 1),
                            //   ),
                            //   icon: Icon(
                            //   Icons.east,
                            //   size: 26,
                            // ),
                            //   label: const Text(
                            //     ""),
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => AllPopularList()));
                            //   },
                            // ),),

                            // Text(
                            //   "Lihat ",
                            //   style: TextStyle(
                            //       fontFamily: 'Mulish-Regular', fontSize: 18),
                            // ),
                            // SizedBox(
                            //   child:
                            // IconButton(
                            //   icon: const Icon(Icons.east, size: 26),
                            //   color: Colors.black,
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => AllPlace()));
                            //   },
                            // ),

                            // Icon(
                            //   Icons.east,
                            //   size: 26,

                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            height: 3,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff14C38E),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 220,
                    child: PageView(
                      children: <Widget>[
                        PopularList(
                          uid: _currentUser != null
                              ? _currentUser!.id.toString()
                              : null,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 12, right: 4, top: 10, bottom: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     // crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Festival Budaya Lampung",
                  //         style: TextStyle(
                  //             fontFamily: 'Mulish-Regular', fontSize: 18),
                  //       ),
                  //       // SizedBox(
                  //       //   width: 100,
                  //       // ),
                  //       IconButton(
                  //         icon: const Icon(Icons.east, size: 26),
                  //         color: Colors.black,
                  //         onPressed: () {
                  //           // Navigator.push(
                  //           //     context,
                  //           //     MaterialPageRoute(
                  //           //         builder: (context) => AllPopularList()));
                  //         },
                  //       ),
                  //       // Icon(
                  //       //   Icons.east,
                  //       //   size: 26,
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   height: 220,
                  //   child: PageView(
                  //     children: <Widget>[
                  //       FestivalBudayaList(),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 12, right: 4, top: 10, bottom: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     // crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Baru-baru ini ditambahkan",
                  //         style: TextStyle(
                  //             fontFamily: 'Roboto-Regular', fontSize: 18),
                  //       ),
                  //       IconButton(
                  //         icon: const Icon(Icons.east, size: 26),
                  //         color: Colors.black,
                  //         onPressed: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => AllBaruList()));
                  //         },
                  //       ),

                  //       // Icon(
                  //       //   Icons.east,
                  //       //   size: 26,
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   height: 220,
                  //   child: PageView(
                  //     children: <Widget>[
                  //       BaruList(),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 24,
                      right: 4,
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tempat rekomendasi",
                          style: regularTextStyle.copyWith(fontSize: 18),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                            height: 3,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff14C38E),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, bottom: 0),
                      child: Column(
                        children: [
                          Container(
                            child: _isLoading
                                ? ListView.builder(
                                    itemCount: 3,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        const CardSkelton(),
                                  )
                                : ListView.builder(
                                    itemCount: 3,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () => customAnimationWidget(
                                          newPage: DetailPlace(
                                            data: _Tour[index],
                                            uid: _currentUser != null
                                                ? _currentUser!.id.toString()
                                                : null,
                                          ),
                                          context: context,
                                          transitionBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            var begin = 0.0;
                                            var end = 1.0;
                                            var curve = Curves.easeIn;

                                            var tween = Tween(
                                                    begin: begin, end: end)
                                                .chain(
                                                    CurveTween(curve: curve));

                                            return ScaleTransition(
                                              scale: animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                        ).then(onGoBack),
                                        child: Container(
                                            height: 200,
                                            width: double.infinity,
                                            margin: EdgeInsets.only(bottom: 12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                // image: AssetImage(itemsfestifalbudaya[index].image),
                                                image: NetworkImage(
                                                    _Tour[index]
                                                        .image
                                                        .toString(),
                                                    scale: 1.0),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        15)),
                                                            color: Color(
                                                                0xff00a877)
                                                            // color: Color.fromARGB(157, 222, 238, 5)
                                                            ),
                                                        height: 35,
                                                        width: 90,
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const Icon(
                                                                Icons.favorite,
                                                                size: 22,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              SizedBox(
                                                                width: 6,
                                                              ),
                                                              Text(
                                                                _Tour[index]
                                                                    .like
                                                                    .toString(),
                                                                style:
                                                                    regularTextStyle
                                                                        .copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              const Icon(
                                                                Icons.warning,
                                                                size: 22,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                            ]),
                                                      ),
                                                    ]),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(15),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15)),
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    // color: Color.fromARGB(157, 222, 238, 5)
                                                  ),
                                                  height: 60,
                                                  width: double.infinity,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12,
                                                            right: 12),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          _Tour[index]
                                                              .name
                                                              .toString(),
                                                          style:
                                                              regularTextStyle
                                                                  .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons.location_on,
                                                              size: 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Text(
                                                              _Tour[index]
                                                                  .locationName
                                                                  .toString(),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  regularTextStyle
                                                                      .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      );
                                    }),
                          ),
                        ],
                      ))
                ]),
          ),
        ),
        floatingActionButton: Container(
          height: MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width * 0.2,
          child: FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: () => slideRightWidget(
              newPage: EmergencyPage(),
              context: context,
            ),
            child: Image(
              image: AssetImage(
                'assets/icons/emergency.png',
              ),
              height: 40,
            ),
          ),
        ));
  }
}

class CardSkelton extends StatelessWidget {
  const CardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
        ),
        margin: EdgeInsets.only(bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  // color: Colors.black.withOpacity(0.5),
                  color: Colors.grey.shade400,
                  // color: Color.fromARGB(157, 222, 238, 5)
                ),
                height: 28,
                width: 70,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: 20,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 20,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                  ),
                ]),
              ),
            ]),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                color: Colors.grey.shade400,
                // color: Color.fromARGB(157, 222, 238, 5)
              ),
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 10, bottom: 10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 12,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      height: 8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
