import 'package:first_app/model/baru_model.dart';
import 'package:flutter/material.dart';

class BaruList extends StatelessWidget {
  const BaruList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffB4D6EF),
        body: Container(
          child: SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: itemsBaru.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green[700],
                  image: DecorationImage(
                    // image: AssetImage(itemsBaru[index].image),
                    // image: AssetImage("${itemsBaru[index]['Image']}"),
                    image: NetworkImage("${itemsBaru[index]['Image']}"),
                    // image: NetworkImage(
                    //     "https://st.depositphotos.com/1005914/2556/i/600/depositphotos_25567715-stock-photo-garbage-and-seagulls.jpg"),

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
                    // itemsBaru[index].name,
                    "${itemsBaru[index]['Name']}",
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
