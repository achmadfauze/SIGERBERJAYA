import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_app/view/page/menu/savePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailTempat extends StatefulWidget {
  const DetailTempat({super.key});

  @override
  State<DetailTempat> createState() => _DetailTempatState();
}

class _DetailTempatState extends State<DetailTempat> {
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map> images = [
      {"image": "https://picsum.photos/id/237/200/300"},
      {"image": "https://picsum.photos/id/238/200/300"},
      {"image": "https://picsum.photos/id/239/200/300"},
    ];
    final MediaQueryHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final myAppBar = AppBar(
      backgroundColor: Colors.white54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      flexibleSpace: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQueryHeight * 0.4,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPos = index;
                });
              },
            ),
            items: images.map((i) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: 5),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    image: DecorationImage(
                      image: NetworkImage("${i['image']}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              });
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: images.map((url) {
              int index = images.indexOf(url);
              return Container(
                width: currentPos == index ? 12 : 8,
                height: currentPos == index ? 12 : 8,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 2,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPos == index ? Colors.white : Colors.white54),
              );
            }).toList(),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            MediaQueryHeight * 0.4 - MediaQuery.of(context).padding.top),
        child: myAppBar,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
            child: Row(
              children: [
                Expanded(flex: 1, child: Icon(Icons.place)),
                Expanded(
                  flex: 8,
                  child: Text(
                      "Sinar Banten/Bekri, Bekri, Kabupaten Lampung Tenga"),
                ),
                Expanded(flex: 1, child: Icon(Icons.favorite_border)),
                Expanded(flex: 1, child: Icon(Icons.comment)),
                Expanded(flex: 1, child: Icon(Icons.archive)),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
              child: Column(
                children: [
                  Text(
                    "Danau Bekri",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
