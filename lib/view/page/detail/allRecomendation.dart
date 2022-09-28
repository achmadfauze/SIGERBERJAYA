import 'package:first_app/model/recomendationModel.dart';
import 'package:flutter/material.dart';

class AllRecomendationList extends StatelessWidget {
  const AllRecomendationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appbar widget on Scaffold
        title: Text("Tempat Rekomendasi"), //title aof appbar
        backgroundColor: Color(0xff00a877),
        bottom: PreferredSize(
            child: Container(
              color: Colors.orange,
              height: 0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      backgroundColor: Color.fromARGB(255, 236, 228, 228),
      body: Container(
        // margin: EdgeInsets.only(top: 8),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 0),

            // child: Container(
            child: ListView.builder(
              itemCount: itemsRecomendation.length,
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                height: 200,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
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
                          image: NetworkImage(
                              "${itemsRecomendation[index]['Image']}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
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
                                  "${itemsRecomendation[index]['Name']}",
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
                                  child: Text(
                                      "${itemsRecomendation[index]['Desc']}",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Text("${itemsRecomendation[index]['Date']}",
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
                                    Text(
                                        "${itemsRecomendation[index]['Liked']}",
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
                                    Text(
                                        "${itemsRecomendation[index]['Comment']}",
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
    );
  }
}
