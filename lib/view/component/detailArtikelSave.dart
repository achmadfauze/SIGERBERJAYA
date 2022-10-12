import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:first_app/model/artikel.dart';

class DetailArtikelSave extends StatefulWidget {
  // final Space space;
  // DetailArtikelSave({
  //   Key? key,
  //   required this.space,
  //   // required Space space,
  // }) : super(key: key);
  @override
  State<DetailArtikelSave> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikelSave> {
  @override
  Widget build(BuildContext context) {
    final myAppbar = AppBar(
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
    );
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final bodyHeight = MediaQueryHeight -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppbar,
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.watch_later_outlined,
                      size: 18,
                    ),
                  ),
                  WidgetSpan(
                      child: Text(
                    // widget.space.createAt.toString(),
                    " 23 September 22",
                    style:
                        TextStyle(fontSize: 16, fontFamily: 'Roboto-Regular'),
                  )),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Tempat Rekomendasi Wisata Di Lampung asdasadadas",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.link,
                            size: 20,
                          ),
                        ),
                        WidgetSpan(
                            child: Text(
                          " itrip",
                          style: TextStyle(fontSize: 18),
                        )),
                      ]),
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.favorite,
                          size: 30,
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.turned_in_not_sharp,
                          size: 30,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              Container(
                width: bodyWidth,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://picsum.photos/seed/picsum/300/200"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.favorite,
                                size: 20,
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                " 5 ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 15),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.comment,
                                    size: 20,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Text(
                                    " Komentar",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  // widget.space.description.toString(),
                  "Contented get distrusts certainty nay are frankness concealed ham. On unaffected resolution on considered of. No thought me husband or colonel forming effects. End sitting shewing who saw besides son musical adapted. Contrasted interested eat alteration pianoforte sympathize was. He families believed if no elegance interest surprise an. It abode wrong miles an so delay plate. She relation own put outlived may disposed. ",
                  style: TextStyle(fontSize: 18, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
