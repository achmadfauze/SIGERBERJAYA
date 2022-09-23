import 'package:first_app/main.dart';
import 'package:first_app/model/festivalbudayamodel.dart';
import 'package:first_app/model/recomendationModel.dart';
import 'package:first_app/view/component/BaruList.dart';
import 'package:first_app/view/component/carousel.dart';
import 'package:first_app/view/component/festivalBudayaList.dart';
import 'package:first_app/view/component/popular%20List.dart';
import 'package:first_app/view/component/recomendationList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                height: 220,
                child: PageView(
                  children: <Widget>[
                    Carousel(),
                  ],
                ),
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
                          TextStyle(fontFamily: 'Mulish-Regular', fontSize: 18),
                    ),
                    Icon(
                      Icons.east,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Container(
                height: 220,
                child: PageView(
                  children: <Widget>[
                    PopularList(),
                  ],
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
                          TextStyle(fontFamily: 'Mulish-Regular', fontSize: 18),
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
              Container(
                height: 220,
                child: PageView(
                  children: <Widget>[
                    FestivalBudayaList(),
                  ],
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
                    left: 12, right: 12, top: 12, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Tempat yang direkomendasikan",
                      style:
                          TextStyle(fontFamily: 'Mulish-Regular', fontSize: 18),
                    ),
                    Icon(
                      Icons.east,
                      size: 30,
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 220,
              //   child: PageView(
              //     children: <Widget>[
              //       RecomendationList(),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 0),
                // child: Container(
                child: ListView.builder(
                  itemCount: itemsRecomendation.length,
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
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 140,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          color: Colors.black38,
                        ),
                        height: 80,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemsRecomendation[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Mulish-Regular',
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                itemsRecomendation[index].address,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Mulish-Regular',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
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
