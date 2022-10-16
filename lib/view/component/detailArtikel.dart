import 'package:flutter/material.dart';
import 'package:first_app/model/artikel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../model/theme.dart';
import 'package:maps_launcher/maps_launcher.dart';

class DetailArtikel extends StatefulWidget {
  final String? articleCode;
  final Article? data;
  // final TourPop? adata;
  const DetailArtikel({
    super.key,
    this.articleCode,
    this.data,
  });
  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  final lat = -5.436068787303937;
  final long = 105.22953153927098;

  // _lauchMap() {
  //   final String googleMapUrl = "comgooglemaps://?center=$lat,$long";
  //   // ignore: deprecated_member_use
  //   if (await canLaunch(googleMapUrl)) {
  //     // ignore: deprecated_member_use
  //     await launch(googleMapUrl);
  //   } else {
  //     throw "Tidak Dapat Menampilkan URL";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final myAppbar = AppBar(
      actions: [
        IconButton(
            onPressed: () => MapsLauncher.launchCoordinates(
                  lat,
                  long,
                  widget.data!.title.toString(),
                ),
            // _lauchMap();

            icon: Icon(Icons.share))
      ],
    );
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final bodyHeight = MediaQueryHeight -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppbar,
      body: ListView(
        padding: EdgeInsets.all(edge),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(
                  Icons.watch_later_outlined,
                  size: 15,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  widget.data!.createAt.toString(),
                  // " 23 September 22",
                  style: regularTextStyle.copyWith(
                    fontSize: 14,
                  ),
                )
              ]),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  widget.data!.title.toString(),
                  // "Tempat Rekomendasi Wisata Di Lampung asdasadadas",
                  style: regularTextStyle.copyWith(
                      letterSpacing: 1.0,
                      height: 1.3,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                  height: 3,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff14C38E),
                  )),
              Container(
                width: 200,
                child: Flexible(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                            child:
                                // Icon(
                                //   Icons.link,
                                //   size: 18,
                                // ),
                                Text(
                          "witasatanusantara.com",
                          // widget.data!.url.toString(),
                          style: regularTextStyle.copyWith(
                            fontSize: 12,
                          ),
                          // maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        )),
                      ]),

                  // RichText(
                  //   text: TextSpan(children: [
                  //     WidgetSpan(
                  //       child: Icon(
                  //         Icons.favorite,
                  //         size: 30,
                  //       ),
                  //     ),
                  //     WidgetSpan(
                  //       child: Icon(
                  //         Icons.turned_in_not_sharp,
                  //         size: 30,
                  //       ),
                  //     ),
                  //   ]),
                  // ),
                ),
              ),
              Container(
                width: bodyWidth,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://picsum.photos/seed/picsum/300/200"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.favorite,
                                size: 20,
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                " 5 ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 15),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.comment,
                                    size: 20,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Text(
                                    " Komentar",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  widget.data!.description.toString(),
                  // "Contented get distrusts certainty nay are frankness concealed ham. On unaffected resolution on considered of. No thought me husband or colonel forming effects. End sitting shewing who saw besides son musical adapted. Contrasted interested eat alteration pianoforte sympathize was. He families believed if no elegance interest surprise an. It abode wrong miles an so delay plate. She relation own put outlived may disposed. ",
                  style: TextStyle(fontSize: 18, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
