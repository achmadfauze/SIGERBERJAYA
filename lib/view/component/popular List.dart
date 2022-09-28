import 'package:first_app/model/popular_model.dart';
import 'package:flutter/material.dart';

class PopularList extends StatelessWidget {
  const PopularList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: itemsPopular.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.green[700],
                    image: DecorationImage(
                      image: NetworkImage("${itemsPopular[index]['Image']}"),
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
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                                  "${itemsPopular[index]['Liked']}",
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
                            "${itemsPopular[index]['Name']}",
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
        ));
  }
}
