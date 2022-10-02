import 'package:first_app/model/recomendationModel.dart';
import 'package:first_app/view/component/BaruList.dart';
import 'package:first_app/view/component/carousel.dart';
import 'package:first_app/view/component/detailTempat.dart';
import 'package:first_app/view/component/festivalBudayaList.dart';
import 'package:first_app/view/component/popular%20List.dart';
import 'package:first_app/view/page/detail/allBaruList.dart';
import 'package:first_app/view/page/detail/allPopularList.dart';
import 'package:first_app/view/page/detail/allRecomendation.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "SIGER BERJAYA",
                            style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Jelajahi Lampung",
                            style: TextStyle(
                                fontFamily: 'Roboto-Regular', fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                primary: Colors.black),
                            child: Container(
                                width: 45,
                                height: 45,
                                // alignment: Alignment.center,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Icon(
                                  Icons.coronavirus,
                                  size: 34,
                                  color: Colors.yellow,
                                )),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //color: Colors.green,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                                  )),
                            ),
                          )
                        ],
                      ),
                      // Icon(
                      //   Icons.east,
                      //   size: 30,
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 240,
                  child: PageView(
                    children: <Widget>[
                      Carousel(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 4, top: 0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Tempat-tempat populer",
                        style: TextStyle(
                            fontFamily: 'Mulish-Regular', fontSize: 18),
                      ),
                      // Container(
                      //   child: ElevatedButton.icon(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.white,
                      //     padding:
                      //         EdgeInsets.symmetric(horizontal: 60, vertical: 1),
                      //   ),
                      //   icon: Icon(
                      //   Icons.east,
                      //   size: 26,
                      // ),
                      //   label: const Text(
                      //     ""),
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => AllPopularList()));
                      //   },
                      // ),),

                      // Text(
                      //   "Lihat ",
                      //   style: TextStyle(
                      //       fontFamily: 'Mulish-Regular', fontSize: 18),
                      // ),
                      // SizedBox(
                      //   child:
                      IconButton(
                        icon: const Icon(Icons.east, size: 26),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllPopularList()));
                        },
                      ),

                      // Icon(
                      //   Icons.east,
                      //   size: 26,

                      // ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                  height: 220,
                  child: PageView(
                    children: <Widget>[
                      PopularList(),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 4, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Festival Budaya Lampung",
                        style: TextStyle(
                            fontFamily: 'Mulish-Regular', fontSize: 18),
                      ),
                      // SizedBox(
                      //   width: 100,
                      // ),
                      IconButton(
                        icon: const Icon(Icons.east, size: 26),
                        color: Colors.black,
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => AllPopularList()));
                        },
                      ),
                      // Icon(
                      //   Icons.east,
                      //   size: 26,
                      // ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                  height: 220,
                  child: PageView(
                    children: <Widget>[
                      FestivalBudayaList(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 4, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Baru-baru ini ditambahkan",
                        style: TextStyle(
                            fontFamily: 'Roboto-Regular', fontSize: 18),
                      ),
                      IconButton(
                        icon: const Icon(Icons.east, size: 26),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllBaruList()));
                        },
                      ),

                      // Icon(
                      //   Icons.east,
                      //   size: 26,
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: 220,
                  child: PageView(
                    children: <Widget>[
                      BaruList(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Tempat yang direkomendasikan",
                        style: TextStyle(
                            fontFamily: 'Mulish-Regular', fontSize: 18),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(top: 0),
                        alignment: Alignment.bottomCenter,
                        icon: const Icon(Icons.east, size: 26),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AllRecomendationList()));
                        },
                      ),
                      // Icon(
                      //   Icons.east,
                      //   size: 26,
                      // ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: -40,
                // ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 0),

                  // child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailTempat()));
                            },
                            child: ListView.builder(
                              itemCount: itemsRecomendation.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Container(
                                  height: 200,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      // image: AssetImage(itemsfestifalbudaya[index].image),
                                      image: NetworkImage(
                                          "${itemsRecomendation[index]['Image']}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(10)),
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                // color: Color.fromARGB(157, 222, 238, 5)
                                              ),
                                              height: 40,
                                              width: 100,
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
                                                      "${itemsRecomendation[index]['Liked']}",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'Roboto-Regular',
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
                                              bottomRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          color: Colors.black.withOpacity(0.5),
                                          // color: Color.fromARGB(157, 222, 238, 5)
                                        ),
                                        height: 60,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 12),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${itemsRecomendation[index]['Name']}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Mulish-Regular',
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  //Icon(Icons.location_on,size: 18,color: Colors.white,),
                                                  Text(
                                                    "${itemsRecomendation[index]['Address']}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'Mulish-Regular',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ]),
                )
              ]),
        ),
      ),
    );
  }
}
