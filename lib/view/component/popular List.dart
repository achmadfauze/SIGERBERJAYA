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
                child: Padding(
                  padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
                  child: Text(
                    //textAlign: TextAlign.justify,
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    "${itemsPopular[index]['Name']}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Mulish-Regular'),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
