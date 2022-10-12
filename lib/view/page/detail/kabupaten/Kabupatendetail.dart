import 'dart:async';
import 'dart:convert';

import 'package:first_app/model/popular_model.dart';
import 'package:first_app/model/tourModel.dart';
import 'package:first_app/view/component/detailTempat.dart';
import 'package:first_app/view/page/menu/cityPage.dart';
import 'package:flutter/material.dart';
import 'package:first_app/model/KabupatenModel.dart';
import 'package:http/http.dart' as http;

class AllKabupatenList extends StatefulWidget {
  final String? stateCode, state, image;
  AllKabupatenList({super.key, this.stateCode, this.state, this.image});

  @override
  State<AllKabupatenList> createState() => _AllKabupatenListState();
}

class _AllKabupatenListState extends State<AllKabupatenList> {
  final List<tour> Tour = [];

  Future<List<tour>> fetchJson() async {
    var response = await http.get(Uri.parse(
        'http://api-siger.uacak.com/api/v1/tourbystate/${widget.stateCode}'));
    List<tour> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
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
        Tour.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appbar widget on Scaffold
        title: Text(widget.state.toString()), //title aof appbar
        backgroundColor: Color(0xff00a877),
      ),
      backgroundColor: Color.fromARGB(255, 236, 228, 228),
      body: Container(
        // margin: EdgeInsets.only(top: 8),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 0),

            // child: Container(
            child: ListView.builder(
              itemCount: Tour.length,
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              itemBuilder: (context, index) => Container(
                height: 200,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (DetailTempat(
                          tourCode: Tour[index].tourCode,
                        )),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 124,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                            // image: AssetImage(itemsfestifalbudaya[index].image),
                            image: NetworkImage(Tour[index].image.toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
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
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "${Tour[index].name}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Mulish-Regular',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black38,
                                    size: 16,
                                  ),
                                  Flexible(
                                    child: Text("${Tour[index].locationName}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontFamily: 'Mulish-Regular',
                                          fontSize: 14,
                                        )),
                                  )
                                ],
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
                                      Text("${Tour[index].createAt}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontFamily: 'Mulish-Regular',
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
                                      Text("${Tour[index].like}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 14,
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.comment,
                                        color: Colors.black38,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text("${Tour[index].comment}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 14,
                                          )),
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
