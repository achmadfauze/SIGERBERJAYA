import 'dart:convert';

// import 'package:first_app/model/baru_model.dart';
import 'package:first_app/view/component/detailArtikel.dart';
import 'package:first_app/view/component/detailTempat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:first_app/model/artikel.dart';
import '../../../model/theme.dart';
import '../../component/Emergency.dart';
import 'package:route_transitions/route_transitions.dart';

class NewsPage extends StatefulWidget {
  // const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<Article> _Article = [];

  Future<List<Article>> fetchJson() async {
    var response =
        await http.get(Uri.parse('http://hiskia.xyz//api/v1/article'));
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
        _Article.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appbar widget on Scaffold
        title: Text("Berita Wisata Lampung",
            style: regularTextStyle.copyWith(
                fontSize: 18, color: Colors.white)), //title aof appbar
        backgroundColor: Color(0xff00a877),
        bottom: PreferredSize(
            child: Container(
              color: Colors.orange,
              height: 0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      backgroundColor: Color.fromARGB(255, 236, 228, 228),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 0),

          // child: Container(
          child: ListView.builder(
              itemCount: _Article.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // {
                // final space = _Space[index];
                return Container(
                  height: 280,
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () =>
                            // space: space,
                            customAnimationWidget(
                          newPage: DetailArtikel(
                            data: _Article[index],
                          ),
                          context: context,
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = 0.0;
                            var end = 1.0;
                            var curve = Curves.easeIn;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return ScaleTransition(
                              scale: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                        child: Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                              // image: AssetImage(itemsfestifalbudaya[index].image),
                              image: NetworkImage(
                                  "${itemsArtikel[index]['Image']}".toString(),
                                  scale: 1.0),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.white,
                          // color: Color.fromARGB(157, 222, 238, 5)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 10, right: 12, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // SizedBox(
                                  //   width: 3,
                                  // ),
                                  Flexible(
                                    child: Text(
                                      // space.title.toString(),
                                      _Article[index].title.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: regularTextStyle.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Icon(
                                  //   Icons.location_on_outlined,
                                  //   color: Colors.black38,
                                  //   size: 16,
                                  // ),
                                  Flexible(
                                    child: Text(
                                        // "${itemsArtikel[index]['Image']}"
                                        //     .toString(),
                                        _Article[index].description.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: regularTextStyle.copyWith(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Icon(
                                        Icons.schedule_outlined,
                                        color: Colors.black38,
                                        size: 13,
                                      ),
                                      Text(_Article[index].createAt.toString(),
                                          // space.createAt.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: regularTextStyle.copyWith(
                                            color: Colors.black,
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.black38,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(_Article[index].like.toString(),
                                          // space.like.toString(),
                                          style: regularTextStyle.copyWith(
                                            color: Colors.black,
                                            fontSize: 14,
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                );
              }),
        ),
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
          child: Image(
            image: AssetImage(
              'assets/icons/emergency.png',
            ),
            height: 40,
          ),
        ),
      ),
    );
  }
}
