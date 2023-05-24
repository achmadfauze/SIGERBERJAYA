import 'package:first_app/model/carouselmodel.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Map> images = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcRVZdSLd2KA1E3rPOTYyoZ0LHqbfSKmFdslks1XpzLW4MFeky1zR1Y-ET0_fny9cX323Okodi_iXl3YN6tuQXAEJg"
    },
    {
      "image":
          "https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQrYLU1GZu7OIM5s9BuEcGvq6K7kG4PkhWhTePEvDCsOdhQ0cuSekLIGtuUDfFLx8CvnDdlkdFbhSnkHeHuZ4kPDw"
    },
    {"image": "https://i.ytimg.com/vi/wbTvwR6By50/maxresdefault.jpg"},
  ];

  // final List<Widget> myData = [
  //   Container(
  //     height: 300,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(15),
  //       color: Colors.green,
  //     ),
  //     child: Center(child: Text('Text1')),
  //   ),
  //   Container(
  //     height: 300,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(15),
  //       color: Colors.green,
  //       // image: DecorationImage(
  //       //           // image: AssetImage(itemsfestifalbudaya[index].image),
  //       //           image: NetworkImage("${itemsCarousel[index]['Image']}"),
  //       //           fit: BoxFit.cover,
  //       //         ),
  //     ),
  //     child: Center(child: Text('Text2')),
  //   ),
  //   Container(
  //     height: 300,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(15),
  //       color: Colors.green,
  //     ),
  //     child: Center(child: Text('Text3')),
  //   )
  // ];

  static get index => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
                child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      // aspectRatio: 2,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: images.map((i) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          // margin: EdgeInsets.symmetric(horizontal: 5),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              image: NetworkImage("${i['image']}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      });
                    }).toList())),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: images.map((url) {
                int index = images.indexOf(url);
                return Container(
                  width: _current == index ? 8 : 6,
                  height: _current == index ? 8 : 6,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 2,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _current == index ? Color(0xff14C38E) : Colors.grey),
                );
              }).toList(),
            ),
            //   CarouselSlider(
            //     items: myData,
            //     carouselController: _controller,
            //     options: CarouselOptions(
            //         autoPlay: true,
            //         enlargeCenterPage: true,
            //         aspectRatio: 2.0,
            //         onPageChanged: (index, reason) {
            //           setState(() {
            //             _current = index;
            //           });
            //         }),
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: myData.asMap().entries.map((entry) {
            //     return GestureDetector(
            //       onTap: () => _controller.animateToPage(entry.key),
            //       child: Container(
            //         width: 8.0,
            //         height: 8.0,
            //         margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
            //         decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: (Theme.of(context).brightness == Brightness.dark
            //                     ? Colors.white
            //                     : Colors.blue)
            //                 .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            //       ),
            //     );
            //   }).toList(),
            // ),
          ],
        ));
  }
}
// import 'package:first_app/model/carouselmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

// class Carousel extends StatefulWidget {
//   const Carousel({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<Carousel> createState() => _CarouselState();
// }

// class _CarouselState extends State<Carousel> {
//   List<CarouselItem> itemList = [
//     CarouselItem(
//       image: NetworkImage(
//           "https://miro.medium.com/max/1400/1*RpaR1pTpRa0PUdNdfv4njA.png"),
//       // image: NetworkImage("${itemsCarousel[]['Image']}"),
//       boxDecoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: FractionalOffset.bottomCenter,
//           end: FractionalOffset.topCenter,
//           colors: [
//             Colors.blueAccent.withOpacity(1),
//             Colors.black.withOpacity(.3),
//           ],
//           stops: const [0.0, 1.0],
//         ),
//       ),
//       title:
//           // '"${itemsCarousel[index]['Name']}"',
//           'Push your creativity to its limits by reimagining this classic puzzle!',
//       titleTextStyle: const TextStyle(
//         fontSize: 12,
//         color: Colors.white,
//       ),
//       leftSubtitle: '\$51,046 in prizes',
//       rightSubtitle: '4882 participants',
//       rightSubtitleTextStyle: const TextStyle(
//         fontSize: 12,
//         color: Colors.black,
//       ),
//       onImageTap: (i) {},
//     ),
//     CarouselItem(
//       image: NetworkImage(
//           "https://miro.medium.com/max/1400/1*RpaR1pTpRa0PUdNdfv4njA.png"),
//       // image: NetworkImage("${itemsCarousel[]['Image']}"),

//       title: '@coskuncay published flutter_custom_carousel_slider!',
//       titleTextStyle: const TextStyle(
//         fontSize: 12,
//         color: Colors.white,
//       ),
//       leftSubtitle: '11 Feb 2022',
//       rightSubtitle: 'v1.0.0',
//       onImageTap: (i) {},
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   CustomCarouselSlider(
//                     items: itemList,
//                     height: 200,
//                     subHeight: 50,
//                     width: MediaQuery.of(context).size.width * .93,
//                     autoplay: true,
//                     indicatorPosition: IndicatorPosition.bottom,
//                     selectedDotColor: Color(0xff14C38E),
//                     unselectedDotColor: Colors.grey,
//                     dotSpacing: 3,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
