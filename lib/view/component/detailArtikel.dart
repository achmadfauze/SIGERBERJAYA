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
  bool isFavorite = false;
  bool isArchive = false;

  @override
  Widget build(BuildContext context) {
    final myAppbar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // actions: [
      //   IconButton(
      //       onPressed: () => MapsLauncher.launchCoordinates(
      //             lat,
      //             long,
      //             widget.data!.title.toString(),
      //           ),
      //       // _lauchMap();

      //       icon: Icon(Icons.share))
      // ],
    );
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final bodyHeight = MediaQueryHeight -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      // appBar: myAppbar,
      body: ListView(
        padding: EdgeInsets.all(edge),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 0, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/btn_backartikel.png',
                        width: 45,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/btn_share.png',
                        width: 45,
                      ),
                    ),
                    // Image.asset(
                    //   'assets/btn_wishlist.png',
                    //   width: 40,
                    // ),
                  ],
                ),
              ),
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
              Padding(
                padding: EdgeInsets.all(edge),
                child: Container(
                  width: 200,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.link,
                          size: 15,
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              // "witasatanusantara.com",
                              widget.data!.url.toString(),
                              style: regularTextStyle.copyWith(
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                width: bodyWidth,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://picsum.photos/seed/picsum/300/200"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 15, right: 10, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // setState(() {
                              //   if (_currentUser != null) {
                              //     if (isFavorite == false) {
                              //       likeHandler().then((value) {
                              //         if (value == "200") {
                              //           setState(() {
                              //             like++;
                              //           });
                              //         }
                              //       });
                              //     } else {
                              //       dislikeHandler().then(
                              //         (value) {
                              //           if (value == "200") {
                              //             setState(() {
                              //               like--;
                              //             });
                              //           }
                              //         },
                              //       );
                              //     }
                              //     isFavorite = !isFavorite;
                              //   }
                              // });
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
                            onTap: () {},
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
                              // setState(() {
                              //   if (_currentUser != null) {
                              //     if (isArchive == false) {
                              //       archiveHandler().then((value) {
                              //         if (value == "200") {
                              //           setState(() {});
                              //         }
                              //       });
                              //     } else {
                              //       unarchiveHandler().then(
                              //         (value) {
                              //           if (value == "200") {
                              //             setState(() {});
                              //           }
                              //         },
                              //       );
                              //     }
                              //     isArchive = !isArchive;
                              //   }
                              // });
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
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.data!.like.toString(),
                      style: regularTextStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Icon(
                      Icons.comment,
                      size: 20,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.data!.comment.toString(),
                      style: regularTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
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
