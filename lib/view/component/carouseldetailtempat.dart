import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselDetail extends StatefulWidget {
  const CarouselDetail({super.key});

  @override
  State<CarouselDetail> createState() => _CarouselDetailState();
}

class _CarouselDetailState extends State<CarouselDetail> {
  int currentPos = 0;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final List<Map> images = [
      {
        "image":
            "https://cdn.popbela.com/content-images/post/20200131/1000x6679-1b0e2274922249bf33b28ce274d87531_750x500.jpg"
      },
      {"image": "https://picsum.photos/id/238/200/300"},
      {"image": "https://picsum.photos/id/239/200/300"},
    ];
    final MediaQueryHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final myAppBar = ScrollAppBar(
      elevation: 0,
      controller: controller,
      backgroundColor: Colors.transparent,
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
                    color: Colors.transparent,
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
    return Scaffold();
  }
}
