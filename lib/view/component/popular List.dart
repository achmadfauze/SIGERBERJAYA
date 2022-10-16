import 'dart:convert';

// import 'package:first_app/model/popular_model.dart';
// import 'package:first_app/model/TourModel.dart';
// import 'package:first_app/view/component/detailTempat.dart';
import 'package:first_app/model/tourModel.dart';
import 'package:first_app/view/page/detail/populerdetail.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/theme.dart';

class PopularList extends StatefulWidget {
  // final String? stateCode, state, image;
  // AllKabupatenList({super.key, this.stateCode, this.state, this.image});
  final String? uid;
  PopularList({this.uid});
  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  // const PopularList({super.key});
  final List<tour> _Tour = [];

  Future<List<tour>> fetchJson() async {
    var response = await http
        // .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
        .get(Uri.parse('https://hiskia.xyz/public/api/v1/populertour/5'));
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

  @override
  void initState() {
    fetchJson().then((value) {
      setState(() {
        _Tour.addAll(value);
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
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SizedBox(
          height: 220,
          child: ListView.builder(
              itemCount: _Tour.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // final space = _Tour[index];
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Colors.green[700],
                      image: DecorationImage(
                        image: NetworkImage(
                          // "${itemsPopular[index]['Image']}",
                          _Tour[index].image.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: double.infinity,
                    width: 150,
                    margin: EdgeInsets.only(left: 12),
                    child: InkWell(
                        onTap: () => customAnimationWidget(
                              newPage: DetailPlace(
                                data: _Tour[index],
                                uid: widget.uid,
                              ),
                              context: context,
                              transitionBuilder: (context, animation,
                                  secondaryAnimation, child) {
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
                            ).then(onGoBack),

                        // scaleWidget(
                        //       newPage: DetailPlace(
                        //         space: space,
                        //       ),
                        //       context: context,
                        //     ),
                        // {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               DetailPlace(space: space)));
                        // },
                        // child: Image.asset(
                        //   items[index].image,
                        //   fit: BoxFit.cover,
                        // ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      // color: Colors.black.withOpacity(0.5),
                                      color: Color(0xff00a877),
                                      // color: Color.fromARGB(157, 222, 238, 5)
                                    ),
                                    height: 28,
                                    width: 70,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.favorite,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            _Tour[index].like.toString(),
                                            // space.like.toString(),
                                            style: regularTextStyle.copyWith(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          const Icon(
                                            Icons.warning,
                                            size: 16,
                                            color: Colors.yellow,
                                          ),
                                        ]),
                                  ),
                                ]),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                color: Colors.black.withOpacity(0.5),
                                // color: Color.fromARGB(157, 222, 238, 5)
                              ),
                              height: 60,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 10, bottom: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // space.name.toString(),
                                      _Tour[index].name.toString(),
                                      style: regularTextStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      // space.ticket.toString(),
                                      _Tour[index].ticket.toString(),
                                      // "10.000",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
                        //   child: Text(
                        //     //textAlign: TextAlign.justify,
                        //     // maxLines: 2,
                        //     // overflow: TextOverflow.ellipsis,
                        //     "${itemsPopular[index]['Name']}",
                        //     style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 16,
                        //         fontFamily: 'Mulish-Regular'),
                        //   ),
                        // ),
                        ));
              }),
        ),
      ),
    );
  }
}
