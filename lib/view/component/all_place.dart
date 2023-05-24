import 'dart:convert';

import 'package:first_app/view/page/detail/allDetail.dart';
import 'package:first_app/view/page/detail/populerdetail.dart';
import 'package:flutter/material.dart';
import 'package:first_app/model/API_wisata.dart';
import 'package:first_app/view/component/search.dart';
// import 'package:first_app/model/modelAll.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:first_app/model/tourModel.dart';
import 'package:http/http.dart' as http;

import '../../model/theme.dart';

class AllPlace extends StatefulWidget {
  String? uid;
  AllPlace({this.uid});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AllPlace> {
  // final FetchSpace _Space = FetchSpace();

  final List<tour> _Tour = [];
  late bool _isLoading;
  Future<List<tour>> fetchJson() async {
    var response = await http
        // .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
        .get(Uri.parse('https://api.siger.uacak.com/public/api/v1/tour'));
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
    _isLoading = true;
    fetchJson().then((value) {
      setState(() {
        _isLoading = false;
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
      appBar: AppBar(
        title: Text("Wisata Lampung"),
        backgroundColor: Color(0xff00a877),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchUser());
            },
            icon: Icon(Icons.search_sharp),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 12,
          left: 12,
          right: 12,
        ),
        child: _isLoading
            ? ListView.builder(
                itemCount: 4,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const CardSkelton(),
              )
            : ListView.builder(
                itemCount: _Tour.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 200,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://siger.uacak.com/api/public/assets/uploads/${_Tour[index].image.toString()}',
                              scale: 1.0),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: InkWell(
                        onTap: () => customAnimationWidget(
                          newPage: DetailPlace(
                            data: _Tour[index],
                            uid: widget.uid,
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
                        ).then(onGoBack),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(24),
                                          topRight: Radius.circular(15)),
                                      color: Color(0xff00a877),
                                      // color: Color.fromARGB(157, 222, 238, 5)
                                    ),
                                    height: 35,
                                    width: 95,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.favorite,
                                            size: 22,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            _Tour[index].like.toString(),
                                            // '${data?[index].like}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Roboto-Regular',
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          const Icon(
                                            Icons.warning,
                                            size: 22,
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
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // _Space[index].name.toString(),
                                      _Tour[index].name.toString(),
                                      style: regularTextStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        Flexible(
                                          child: Text(
                                            // _Space[index]
                                            //     .locationName
                                            //     .toString(),
                                            _Tour[index]
                                                .locationName
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: regularTextStyle.copyWith(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                }),
      ),
    );
  }
}

class CardSkelton extends StatelessWidget {
  const CardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
        ),
        margin: EdgeInsets.only(bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  // color: Colors.black.withOpacity(0.5),
                  color: Colors.grey.shade400,
                  // color: Color.fromARGB(157, 222, 238, 5)
                ),
                height: 28,
                width: 70,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: 20,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 20,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                  ),
                ]),
              ),
            ]),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                color: Colors.grey.shade400,
                // color: Color.fromARGB(157, 222, 238, 5)
              ),
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 10, bottom: 10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 12,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      height: 8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
