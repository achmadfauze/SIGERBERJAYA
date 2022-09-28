import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_app/view/page/menu/savePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class DetailTempat extends StatefulWidget {
  const DetailTempat({super.key});

  @override
  State<DetailTempat> createState() => _DetailTempatState();
}

class _DetailTempatState extends State<DetailTempat> {
  int currentPos = 0;
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final List<Map> images = [
      {"image": "https://picsum.photos/id/237/200/300"},
      {"image": "https://picsum.photos/id/238/200/300"},
      {"image": "https://picsum.photos/id/239/200/300"},
    ];
    final MediaQueryHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final myAppBar = ScrollAppBar(
      controller: controller,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      flexibleSpace: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQueryHeight * 0.4,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPos = index;
                });
              },
            ),
            items: images.map((i) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: 5),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    image: DecorationImage(
                      image: NetworkImage("${i['image']}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              });
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: images.map((url) {
              int index = images.indexOf(url);
              return Container(
                width: currentPos == index ? 12 : 8,
                height: currentPos == index ? 12 : 8,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 2,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPos == index ? Colors.white : Colors.white54),
              );
            }).toList(),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            MediaQueryHeight * 0.4 - MediaQuery.of(context).padding.top),
        child: myAppBar,
      ),
      body: ListView(
        controller: controller,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
            child: Row(
              children: [
                Expanded(flex: 1, child: Icon(Icons.place)),
                Expanded(
                  flex: 8,
                  child: Text(
                      "Sinar Banten/Bekri, Bekri, Kabupaten Lampung Tenga"),
                ),
                Expanded(flex: 1, child: Icon(Icons.favorite_border)),
                Expanded(flex: 1, child: Icon(Icons.comment)),
                Expanded(flex: 1, child: Icon(Icons.turned_in_not)),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Danau Bekri",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
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
                            flex: 1,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.comment,
                                    size: 18,
                                  )),
                                  TextSpan(
                                      text: " 0",
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
                ],
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
                              margin:
                                  EdgeInsets.only(left: 15, bottom: 15, top: 8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "POLRES Lampung Tengah",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                          child: Text("BRIPKA Lukman Nulhakim"))
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
                                      WidgetSpan(child: Text("085378753209"))
                                    ]),
                                  ),
                                  RichText(
                                    maxLines: 2,
                                    text: TextSpan(children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.place,
                                          size: 18,
                                          color: Colors.red,
                                        ),
                                      ),
                                      WidgetSpan(
                                          child: Text(
                                              "Jl.Negara No.1 Gn.Sugihm Kec. Gn.Sugih, Kabupaten Lampung Tengah"))
                                    ]),
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
                      "Informasi Kondisi Wisata",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(left: 15, bottom: 15, top: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Saat ini Objek Wisata dalam situasi normal",
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                          margin: EdgeInsets.only(left: 15, bottom: 15, top: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Akses menuju objek aman, kondisi trafik lancar",
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Protokol Kesehatan diterapkan, masyarakat wajib menggunakan masker",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                                    backgroundColor: MaterialStateProperty.all(
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
            margin: EdgeInsets.all(15),
          )
        ],
      ),
    );
  }
}
