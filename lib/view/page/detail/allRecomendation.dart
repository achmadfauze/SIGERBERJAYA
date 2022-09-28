import 'package:first_app/model/popular_model.dart';
import 'package:flutter/material.dart';

class AllRecomendationList extends StatelessWidget {
  const AllRecomendationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appbar widget on Scaffold
        title: Text("Tempat yang direkomendasikan"), //title aof appbar
        backgroundColor: Colors.greenAccent,
        bottom: PreferredSize(
            child: Container(
              color: Colors.orange,
              height: 0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 20),

            // child: Container(
            child: ListView.builder(
              itemCount: itemsPopular.length,
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                  height: 200,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      // image: AssetImage(itemsfestifalbudaya[index].image),
                      image: NetworkImage("${itemsPopular[index]['Image']}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(10)),
                            color: Colors.black.withOpacity(0.5),
                            // color: Color.fromARGB(157, 222, 238, 5)
                          ),
                          height: 40,
                          width: 100,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  "${itemsPopular[index]['Liked']}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto-Regular',
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
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${itemsPopular[index]['Name']}",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Icon(Icons.location_on,size: 18,color: Colors.white,),
                                  Text(
                                    "${itemsPopular[index]['Desc']}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Mulish-Regular',
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
      ),
    );
  }
}
