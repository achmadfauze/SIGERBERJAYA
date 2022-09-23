import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:first_app/view/page/introScreen/intropage3.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> myData = [
    Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      child: Center(child: Text('Text1')),
    ),
    Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      child: Center(child: Text('Text2')),
    ),
    Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      child: Center(child: Text('Text3')),
    )
  ];
  final List _recomendation = [
    'Post 1',
    'post 2',
    'post 3',
    'Post 1',
    'post 2',
  ];
  final List _popular = [
    'Pantai Karang Bolong',
    'Bukit Punggur',
    'post 3',
    'Post 1',
    'post 2',
    'post 3',
    'Post 1',
    'post 2',
    'post 3'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB4D6EF),
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
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/logo.png',
                          height: 50,
                          width: 50,
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
                child: CarouselSlider(
                  items: myData,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: myData.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.blue)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Tempat-tempat populer",
                      style:
                          TextStyle(fontFamily: 'Roboto-Regular', fontSize: 18),
                    ),
                    Icon(
                      Icons.east,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: _popular.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green[700],
                    ),
                    height: double.infinity,
                    width: 130,
                    margin: EdgeInsets.only(left: 12),
                    child: Center(
                      child: Text(
                        _popular[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Festival Budaya Lampung",
                      style:
                          TextStyle(fontFamily: 'Roboto-Regular', fontSize: 18),
                    ),
                    // SizedBox(
                    //   width: 100,
                    // ),
                    Icon(
                      Icons.east,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: _popular.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green[700],
                    ),
                    height: double.infinity,
                    width: 320,
                    margin: EdgeInsets.only(left: 12),
                    child: Center(
                      child: Text(
                        _popular[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Baru-baru ini ditambahkan",
                      style:
                          TextStyle(fontFamily: 'Roboto-Regular', fontSize: 18),
                    ),
                    Icon(
                      Icons.east,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: _popular.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green[700],
                    ),
                    height: double.infinity,
                    width: 130,
                    margin: EdgeInsets.only(left: 12),
                    child: Container(
                      margin: EdgeInsets.only(top: 120),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.rectangle,
                      ),
                      child: Text(
                        textAlign: TextAlign.justify,
                        // maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                        _popular[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Roboto-Regular'),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 12, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Tempat yang direkomendasikan",
                      style:
                          TextStyle(fontFamily: 'Roboto-Regular', fontSize: 18),
                    ),
                    Icon(
                      Icons.east,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 0),
                // child: Container(
                child: ListView.builder(
                  itemCount: _recomendation.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    height: 200,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green[700],
                    ),
                    child: Center(
                      child: Text(
                        _recomendation[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
