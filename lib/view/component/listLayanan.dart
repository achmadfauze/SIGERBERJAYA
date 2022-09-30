import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListLayanan extends StatelessWidget {
  const ListLayanan({super.key, required this.Judul});
  final String Judul;

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text(this.Judul),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.map))],
      ),
      body: Container(
        // padding: EdgeInsets.all(15),
        child: ListView(children: [ListItem(bodyWidth: bodyWidth)]),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.bodyWidth,
  }) : super(key: key);

  final double bodyWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: (() {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) {
          //     return ();
          //   }),
          // );
        }),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 4,
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        alignment: Alignment.centerLeft,
                        "https://picsum.photos/300/200",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Polres Lampung Selatan",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 0,
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.grey[600],
                                        size: 18,
                                      )),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      "Sinar Banten/Bekri, Bekri, Kabbupaten Lampung Tengah",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600]),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 18,
                                      color: Colors.grey[600],
                                    ),
                                    Text(
                                      "20",
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      size: 18,
                                      color: Colors.grey[600],
                                    ),
                                    Text("0")
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: ConstrainedBox(
                                    constraints:
                                        BoxConstraints.tightFor(height: 25),
                                    child: ElevatedButton(
                                      child: Icon(
                                        Icons.phone,
                                        size: 16,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
