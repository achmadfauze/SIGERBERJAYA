import 'package:first_app/model/festivalbudayamodel.dart';
import 'package:first_app/model/popular_model.dart';
import 'package:flutter/material.dart';

class FestivalBudayaList extends StatelessWidget {
  const FestivalBudayaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB4D6EF),
      body: Container(
        // child: SizedBox(
        height: 220,
        child: ListView.builder(
          itemCount: itemsfestifalbudaya.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(itemsPopular[index].image),
                  fit: BoxFit.cover,
                ),
              ),
              height: double.infinity,
              width: 320,
              margin: EdgeInsets.only(left: 12),
              child: (Padding(
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
                          itemsfestifalbudaya[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mulish-Regular',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          itemsfestifalbudaya[index].date,
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
              ))),
        ),
      ),
      // ),
    );
  }
}
