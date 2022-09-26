import 'package:first_app/model/festivalbudayamodel.dart';
import 'package:first_app/model/popular_model.dart';
import 'package:first_app/model/recomendationModel.dart';
import 'package:flutter/material.dart';

class RecomendationList extends StatelessWidget {
  const RecomendationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB4D6EF),
      body: Container(
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
                            "${itemsRecomendation[index]['Name']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mulish-Regular',
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${itemsRecomendation[index]['date']}",
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
                ))

            // Center(
            //   child: Text(
            //     itemsRecomendation[index].name,
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
            ),
      ),
    );
  }
}
