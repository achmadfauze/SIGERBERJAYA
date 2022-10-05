import 'dart:convert';

import 'package:first_app/model/popular_model.dart';
import 'package:first_app/view/component/detailTempat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopularList extends StatefulWidget {
  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  // const PopularList({super.key});
  final List<Space> _Space = [];

  Future<List<Space>> fetchJson() async {
    var response = await http
        // .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
        .get(Uri.parse(
            'http://api-siger.uacak.com/public/api/v1/populertour/5'));
    print(response);
    List<Space> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      print(urjson);
      for (var jsondata in urjson) {
        slist.add(Space.fromJson(jsondata));
      }
    }
    return slist;
  }

  @override
  void initState() {
    fetchJson().then((value) {
      setState(() {
        _Space.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SizedBox(
            height: 220,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailTempat()));
              },
              child: ListView.builder(
                itemCount: _Space.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Colors.green[700],
                      image: DecorationImage(
                        image: NetworkImage(
                          "${itemsPopular[index]['Image']}",
                          // _Space[index].image.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: double.infinity,
                    width: 130,
                    margin: EdgeInsets.only(left: 12),

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
                                  color: Colors.black.withOpacity(0.5),
                                  // color: Color.fromARGB(157, 222, 238, 5)
                                ),
                                height: 28,
                                width: 70,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        _Space[index].like.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Roboto-Regular',
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
                            child: Text(
                              _Space[index].name.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Robot-Regular',
                                fontSize: 16,
                              ),
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
                    ),
              ),
            ),
          ),
        ));
  }
}
