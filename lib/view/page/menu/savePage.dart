import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
  const SavePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final appBar = AppBar(
      title: Text(
        "Tandai",
      ),
      bottom: TabBar(
        tabs: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "Tempat Tersimpan",
              style: TextStyle(fontFamily: "Roboto-Regular", fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
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
                  ListArsipTempat(bodyHeight: bodyHeight),
                  ListArsipTempat(bodyHeight: bodyHeight),
                  ListArsipTempat(bodyHeight: bodyHeight),
                  ListArsipTempat(bodyHeight: bodyHeight),
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
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          print("object");
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 4,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: bodyHeight * 0.15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
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
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: EdgeInsets.only(top: bodyHeight * 0.25 * 0.2),
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
                              flex: 4,
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
    );
  }
}

class ListArsipTempat extends StatelessWidget {
  const ListArsipTempat({
    Key? key,
    required this.bodyHeight,
  }) : super(key: key);

  final double bodyHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (() {
          print("asjads");
        }),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: bodyHeight * 0.15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
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
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Column(
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
                                      fontSize: 16, color: Colors.grey[600]),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: bodyHeight * 0.25 * 0.2),
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
