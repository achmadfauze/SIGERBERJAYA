import 'package:first_app/view/component/detailArtikel.dart';
import 'package:first_app/view/component/detailTempat.dart';
import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
  const SavePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final appBar = AppBar(
      backgroundColor: Color(0xff14C38E),
      title: Text(
        "Tersimpan",
      ),
      bottom: TabBar(
        indicatorColor: Colors.white,
        tabs: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Text(
              "Tempat Tersimpan",
              style: TextStyle(fontFamily: "Roboto-Regular", fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8),
            child: Text(
              "Blog Tersimpan",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Roboto-Regular",
              ),
            ),
          )
        ],
      ),
    );
    final bodyHeight = MediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar,
        body: TabBarView(
          children: [
            SizedBox(
              width: bodyWidth,
              height: bodyHeight,
              child: ListView(
                children: [
                  ListArsipTempat(bodyWidth: bodyWidth),
                  ListArsipTempat(bodyWidth: bodyWidth),
                  ListArsipTempat(bodyWidth: bodyWidth),
                  ListArsipTempat(bodyWidth: bodyWidth),
                ],
              ),
            ),
            Container(
              child: ListView(
                children: [
                  ListArsipArtikel(bodyHeight: bodyHeight),
                  ListArsipArtikel(bodyHeight: bodyHeight),
                  ListArsipArtikel(bodyHeight: bodyHeight),
                  ListArsipArtikel(bodyHeight: bodyHeight),
                  ListArsipArtikel(bodyHeight: bodyHeight),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListArsipArtikel extends StatelessWidget {
  const ListArsipArtikel({
    Key? key,
    required this.bodyHeight,
  }) : super(key: key);

  final double bodyHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
      child: GestureDetector(
        onTap: (() {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return DetailArtikel();
            }),
          );
        }),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 4,
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      child: Image.network(
                        alignment: Alignment.centerLeft,
                        "https://picsum.photos/300/200",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sejumlah Tempat Wisata Lampung Mulai Beroperasi 6 Juni 2021",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      size: 18,
                                      color: Colors.grey[600],
                                    ),
                                    Text(
                                      "20 Des 2021",
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 18,
                                      color: Colors.grey[600],
                                    ),
                                    Text("0")
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListArsipTempat extends StatelessWidget {
  const ListArsipTempat({
    Key? key,
    required this.bodyWidth,
  }) : super(key: key);

  final double bodyWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: (() {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return DetailTempat();
            }),
          );
        }),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 4,
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      child: Image.network(
                        alignment: Alignment.centerLeft,
                        "https://picsum.photos/300/200",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Danau Bakeri",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 0,
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.grey[600],
                                        size: 18,
                                      )),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      "Sinar Banten/Bekri, Bekri, Kabbupaten Lampung Tengah",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600]),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 18,
                                      color: Colors.grey[600],
                                    ),
                                    Text(
                                      "20",
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      size: 18,
                                      color: Colors.grey[600],
                                    ),
                                    Text("0")
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
