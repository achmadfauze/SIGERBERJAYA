import 'package:first_app/model/KabupatenModel.dart';
import 'package:first_app/model/recomendationModel.dart';
import 'package:first_app/view/page/detail/kabupaten/Kabupatendetail.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  // State<CityPage> createState() => _CityPageState();
  State<StatefulWidget> createState() {
    return _CityPage();
  }
}

class _CityPage extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kabupaten / Kota"), //title aof appbar
          backgroundColor: Color(0xff00a877),
        ),
        // color: Color(0xffB4D6EF),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),

            // child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllKabupatenList()));
                },
                child: ListView.builder(
                  itemCount: ItemsKabupaten.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    height: 180,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          // image: AssetImage(itemsfestifalbudaya[index].image),
                          image: NetworkImage(
                            "${ItemsKabupaten[index]['Image']}",
                          ),
                          fit: BoxFit.cover,
                          opacity: 0.8),
                    ),
                    child: Container(
                        child: Center(
                          child: Text(
                            "${ItemsKabupaten[index]['Name']}".toUpperCase(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mulish-Regular',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black45,
                        )),
                  ),
                ),
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
