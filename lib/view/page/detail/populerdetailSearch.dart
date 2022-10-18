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

class DetailPlaceSearch extends StatefulWidget {
  String? tourCode, uid;

  // final TourPop? adata;
  DetailPlaceSearch({
    super.key,
    this.tourCode,
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

class _DetailPageState extends State<DetailPlaceSearch> {
  bool isFavorite = false;
  bool isArchive = false;
  int like = 0;
  tour? data;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;
  bool loading = false;

  Future<int> getILike() async {
    int islike = 0;
    // print("asdsad");

    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/isliketour/${data!.tourCode}/${widget.uid}'));
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
        'https://hiskia.xyz/api/v1/isarchivetour/${data!.tourCode}/${widget.uid}'));
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
        'https://hiskia.xyz/api/v1/liketour/${widget.tourCode}/${widget.uid}'));
    // print(response);
    return (response.statusCode.toString());
  }

  Future<String> dislikeHandler() async {
    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/disliketour/${widget.tourCode}/${widget.uid}'));
    // print(response);
    return (response.statusCode.toString());
  }

  Future<String> archiveHandler() async {
    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/archive_tour/${widget.tourCode}/${widget.uid}'));

    return (response.statusCode.toString());
  }

  Future<String> unarchiveHandler() async {
    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/unarchivetour/${widget.tourCode}/${widget.uid}'));

    return (response.statusCode.toString());
  }

  Future<tour> getTour() async {
    var response = await http
        .get(Uri.parse('https://hiskia.xyz/api/v1/tour/${widget.tourCode}'));
    List<tour> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      for (var jsondata in urjson) {
        slist.add(tour.fromJson(jsondata));
      }
    }
    return slist[0];
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
    getTour().then((value) {
      setState(() {
        data = value;
        like = int.parse(value.like);
        loading = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                data!.image,
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
                                data!.name,
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
                                      data!.ticket,
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
                                            //               data!.tourCode,
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
                                          data!.comment.toString(),
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
                                          fontSize: 14,
                                          color: Colors.green[800]),
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
                                          fontSize: 14,
                                          color: Colors.green[800]),
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
                              data!.description,
                              // "Contented get distrusts certainty nay are frankness concealed ham. On unaffected resolution on considered of. No thought me husband or colonel forming effects. End sitting shewing who saw besides son musical adapted. Contrasted interested eat alteration pianoforte sympathize was. He families believed if no elegance interest surprise an. It abode wrong miles an so delay plate. She relation own put outlived may disposed. ",
                              style: regularTextStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                            left: edge,
                          ),
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
                              Text(
                                data!.locationName,
                                // '${widget.space.locationName}',
                                style: greyTextStyle,
                              ),
                              InkWell(
                                onTap: () {
                                  // launchUrl(
                                  //     'https://goo.gl/maps/SyZx2yjWB1yR6AeH8');

                                  // launchUrl(widget.space.mapUrl);
                                },
                                child: InkWell(
                                  onTap: () => MapsLauncher.launchCoordinates(
                                    double.parse(data!.latitude),
                                    double.parse(data!.longitude),
                                    data!.name.toString(),
                                  ),
                                  child: Image.asset(
                                    'assets/btn_map.png',
                                    width: 40,
                                  ),
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
                                                "https://hiskia.xyz/api/v1/police/${data!.stateCode}",
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
                                                "https://hiskia.xyz/api/v1/restaurant/${data!.stateCode}",
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
                                                "https://hiskia.xyz/api/v1/medicalfacility/${data!.stateCode}",
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
                                                "https://hiskia.xyz/api/v1/hotel/${data!.stateCode}",
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
                                    TextSpan(
                                      text: 'Hotel',
                                      style: greyTextStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
                                      tourCode: data!.tourCode,
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
    } else {
      return Scaffold(
        body: Container(
          child: Center(
            child: Text("loading..."),
          ),
        ),
      );
    }
  }
}
