import 'package:first_app/view/component/popular%20List.dart';
import 'package:first_app/model/API_wisata.dart';
import 'package:flutter/material.dart';

import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/modelAll.dart';
import '../../component/listLayanan.dart';

class AllDetailPlace extends StatefulWidget {
  // const DetailPlace({super.key});

  final Space space;
  AllDetailPlace({
    Key? key,
    required this.space,
    // required Space space,
  }) : super(key: key);

  @override
  State<AllDetailPlace> createState() => _DetailPlaceState();
}

class _DetailPlaceState extends State<AllDetailPlace> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final myAppBar = ScrollAppBar(
      elevation: 0,
      actions: [
        Icon(
          Icons.favorite_border,
          size: 24,
        ),
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.bookmark_border,
          size: 24,
        ),
        SizedBox(
          width: 16,
        ),
      ],
      controller: controller,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      flexibleSpace: ClipRRect(
        // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 8),
                  child: Text(
                    widget.space.name.toString(),
                    style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: myAppBar,
        ),
        body: Container(
            child: ListView(
          controller: controller,
          children: [
            // SizedBox(
            //   height: 300,
            // ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Icon(
                                Icons.place,
                                size: 16,
                                color: Colors.black,
                              ),
                              Flexible(
                                child: Text(
                                  widget.space.locationName.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                              widget.space.like.toString(),
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.comment,
                              size: 22,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.space.like.toString(),
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(left: 12, top: 10, right: 16),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Icon(
                  //             Icons.place,
                  //             size: 16,
                  //             color: Colors.black,
                  //           ),
                  //           Flexible(
                  //             child: Text(
                  //               widget.space.locationName.toString(),
                  //               maxLines: 2,
                  //               overflow: TextOverflow.ellipsis,
                  //               style: TextStyle(
                  //                 fontFamily: 'Roboto-Regular',
                  //                 fontSize: 14,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, top: 10, right: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.favorite,
                                      size: 18,
                                    )),
                                    WidgetSpan(
                                      child: Text(" 20 Orang Menyukai ini",
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 16)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.comment,
                                      size: 18,
                                    )),
                                    TextSpan(
                                        text: " 50",
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text.rich(
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
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.green[800]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.money,
                                      size: 18,
                                    )),
                                    WidgetSpan(
                                      child: Text(" Rp. 0",
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 16)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text.rich(
                                TextSpan(
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
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.green[800]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.people,
                                      size: 18,
                                      color: Colors.green,
                                    )),
                                    WidgetSpan(
                                      child: Text(
                                        " 100 Orang Saat Ini",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.green[800]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
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
                                    style: TextStyle(
                                        color: Colors.green[800], fontSize: 16),
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            "Contented get distrusts certainty nay are frankness concealed ham. On unaffected resolution on considered of. No thought me husband or colonel forming effects. End sitting shewing who saw besides son musical adapted. Contrasted interested eat alteration pianoforte sympathize was. He families believed if no elegance interest surprise an. It abode wrong miles an so delay plate. She relation own put outlived may disposed. ",
                            style: TextStyle(fontSize: 18, height: 1.5),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              "Informasi Kepolisian Terdekat",
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    child: Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/6/6e/Lambang_Polri.png",
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 7,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 15, bottom: 15, top: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "POLRES Lampung Tengah",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          RichText(
                                            text: TextSpan(children: [
                                              WidgetSpan(
                                                child: Icon(
                                                  Icons.person_pin_outlined,
                                                  color: Colors.green,
                                                  size: 18,
                                                ),
                                              ),
                                              WidgetSpan(
                                                  child: Text(
                                                      "BRIPKA Lukman Nulhakim"))
                                            ]),
                                          ),
                                          RichText(
                                            text: TextSpan(children: [
                                              WidgetSpan(
                                                child: Icon(
                                                  Icons.phone,
                                                  size: 18,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              WidgetSpan(
                                                  child: Text("085378753209"))
                                            ]),
                                          ),
                                          Row(children: [
                                            Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.place,
                                                size: 18,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Expanded(
                                                flex: 12,
                                                child: Text(
                                                    "Jl.Negara No.1 Gn.Sugihm Kec. Gn.Sugih, Kabupaten Lampung Tengah"))
                                          ]),
                                        ],
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              "Informasi Kondisi Wisata",
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(
                                      left: 15, bottom: 15, top: 8),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Saat ini Objek Wisata dalam situasi normal",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              "Informasi Jalur Akses Wisata",
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(
                                      left: 15, bottom: 15, top: 8),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Akses menuju objek aman, kondisi trafik lancar",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              "Informasi Protokol Kesehatan",
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(left: 15, top: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Protokol Kesehatan diterapkan, masyarakat wajib menggunakan masker",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextButton(
                                        onPressed: (() => launchUrl(
                                            Uri.parse('https://covid19.go.id/'),
                                            mode: LaunchMode
                                                .externalNonBrowserApplication)),
                                        child: Text(
                                          "For More Covid-19 information",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.amber)),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Layanan",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: (() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return ListLayanan(
                                          Judul: "Kepolisian",
                                        );
                                      }),
                                    );
                                  }),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.amber,
                                        backgroundImage: AssetImage(
                                          ("assets/icons8-policeman-64.png"),
                                        ),
                                      ),
                                      Text("Kepolisian"),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return ListLayanan(
                                          Judul: "Fasilitas Kesehatan",
                                        );
                                      }),
                                    );
                                  }),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.amber,
                                        backgroundImage: AssetImage(
                                          "assets/icons8-facilities-64.png",
                                        ),
                                      ),
                                      Text("Fasilitas Kesehatan"),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.amber,
                                      backgroundImage: AssetImage(
                                        "assets/icons8-tour-guide-64.png",
                                      ),
                                    ),
                                    Text("Pemandu Wisata"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: (() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return ListLayanan(
                                          Judul: "Hotel Terdekat",
                                        );
                                      }),
                                    );
                                  }),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.amber,
                                        backgroundImage: AssetImage(
                                          "assets/icons8-hotel-48.png",
                                        ),
                                      ),
                                      Text("Hotel Terdekat")
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return ListLayanan(
                                          Judul: "Restoran",
                                        );
                                      }),
                                    );
                                  }),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.amber,
                                        backgroundImage: AssetImage(
                                          "assets/icons8-restaurant-48.png",
                                        ),
                                      ),
                                      Text("Restoran"),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.amber,
                                        backgroundImage: AssetImage(
                                          "assets/icons8-review-64.png",
                                        ),
                                      ),
                                      Text("Ulasan"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.amber,
                                        backgroundImage: AssetImage(
                                          "assets/icons8-news-60.png",
                                        ),
                                      ),
                                      Text("Berita"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                    child: Column(
                      children: [
                        Text(
                          "Anda mungkin juga suka",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 220,
                          child: PageView(
                            children: <Widget>[
                              PopularList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
