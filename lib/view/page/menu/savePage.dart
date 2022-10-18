import 'package:first_app/model/artikel.dart';
import 'package:first_app/model/theme.dart';
import 'package:first_app/view/component/detailArtikel.dart';

import 'package:first_app/view/component/detailArtikel.dart';
import 'package:first_app/view/component/detailTempat.dart';
import 'package:first_app/view/page/detail/populerdetail.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import '../../component/Emergency.dart';

import 'package:first_app/model/tourModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SavePage extends StatefulWidget {
  String? uid;
  SavePage({super.key, this.uid});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final List<tour> _Tour = [];
  Future<List<tour>> fetchJson() async {
    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/allarchivetourbyuser/${widget.uid}'));
    List<tour> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      for (var jsondata in urjson) {
        slist.add(tour.fromJson(jsondata));
      }
    }
    return slist;
  }

  final List<Article> _Article = [];

  Future<List<Article>> fetchJsonArticle() async {
    var response = await http.get(Uri.parse(
        'http://hiskia.xyz//api/v1/allarchivearticlewithdetail/${widget.uid}'));
    print(response);
    List<Article> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      // print(urjson);
      for (var jsondata in urjson) {
        slist.add(Article.fromJson(jsondata));
      }
    }
    return slist;
  }

  @override
  void initState() {
    fetchJson().then((value) {
      setState(() {
        _Tour.addAll(value);
      });
    });
    fetchJsonArticle().then((value) {
      setState(() {
        _Article.addAll(value);
      });
    });
    super.initState();
  }

  void refreshData() {
    fetchJson().then((value) {
      setState(() {
        _Tour.clear();
        _Tour.addAll(value);
      });
    });
    fetchJsonArticle().then((value) {
      setState(() {
        _Article.clear();
        _Article.addAll(value);
      });
    });
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final appBar = AppBar(
      backgroundColor: Color(0xff14C38E),
      title: Text(
        "Tersimpan",
        style: regularTextStyle.copyWith(fontSize: 18, color: Colors.white),
      ),
      bottom: TabBar(
        indicatorColor: Colors.white,
        tabs: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Text(
              "Tempat Tersimpan",
              style: regularTextStyle.copyWith(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8),
            child: Text(
              "Blog Tersimpan",
              style: regularTextStyle.copyWith(
                fontSize: 15,
                color: Colors.white,
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
            widget.uid != ""
                ? SizedBox(
                    width: bodyWidth,
                    height: bodyHeight,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _Tour.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (() {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return DetailPlace(
                                  data: _Tour[index],
                                  tourCode: _Tour[index].tourCode,
                                  uid: widget.uid);
                            }),
                          ).then(onGoBack);
                        }),
                        child: ListArsipTempat(
                          bodyWidth: bodyWidth,
                          Tour: _Tour[index],
                          uid: widget.uid,
                        ),
                      ),
                    ),
                  )
                : Container(
                    child: Center(
                      child: Text("Anda Harus Login Terlebih Dahulu"),
                    ),
                  ),
            Container(
              child: widget.uid != ""
                  ? ListView.builder(
                      itemCount: _Article.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return DetailArtikel(
                                  data: _Article[index],
                                  articleCode: _Article[index].articleCode,
                                  uid: widget.uid);
                            }),
                          ).then(onGoBack);
                        },
                        child: ListArsipArtikel(
                            bodyHeight: bodyHeight,
                            article: _Article[index],
                            uid: widget.uid),
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Text("Anda Harus Login Terlebih Dahulu"),
                      ),
                    ),
            )
          ],
        ),
        floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width * 0.2,
          child: FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: () => slideRightWidget(
              newPage: EmergencyPage(),
              context: context,
            ),
            child: const Image(
              image: AssetImage(
                'assets/icons/emergency.png',
              ),
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class ListArsipArtikel extends StatelessWidget {
  String? uid;
  Article? article;
  ListArsipArtikel({Key? key, required this.bodyHeight, this.article, this.uid})
      : super(key: key);

  final double bodyHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
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
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: this.article!.image == 'null'
                        ? Image.asset("assets/LOGO_PARIWISATA.png")
                        : Image.network(
                            alignment: Alignment.centerLeft,
                            this.article!.image.toString(),
                            fit: BoxFit.fitHeight,
                          ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  height: 100,
                  padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        this.article!.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                          // color: Colors.white,
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
                                    this.article!.createAt.substring(0, 10),
                                    style: regularTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
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
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    this.article!.like,
                                    style: regularTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.comment,
                                    size: 18,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    this.article!.comment,
                                    style: regularTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListArsipTempat extends StatefulWidget {
  tour? Tour;
  String? uid;
  ListArsipTempat({Key? key, required this.bodyWidth, this.Tour, this.uid})
      : super(key: key);

  final double bodyWidth;

  @override
  State<ListArsipTempat> createState() => _ListArsipTempatState();
}

class _ListArsipTempatState extends State<ListArsipTempat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
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
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: Image.network(
                      alignment: Alignment.centerLeft,
                      widget.Tour!.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
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
                            widget.Tour!.name,
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                            maxLines: 1,
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
                                    widget.Tour!.locationName,
                                    style: regularTextStyle.copyWith(
                                        fontSize: 15, color: Colors.grey[600]),
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
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    widget.Tour!.like,
                                    style:
                                        regularTextStyle.copyWith(fontSize: 14),
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
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    widget.Tour!.comment,
                                    style:
                                        regularTextStyle.copyWith(fontSize: 14),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
