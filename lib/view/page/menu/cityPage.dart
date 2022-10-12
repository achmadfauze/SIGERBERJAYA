import 'dart:convert';

import 'package:first_app/view/page/menu/homePage.dart';
import 'package:provider/provider.dart';
import 'package:first_app/model/KabupatenModel.dart';
import 'package:first_app/view/page/detail/kabupaten/Kabupatendetail.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:http/http.dart' as http;

import '../../component/Emergency.dart';

class CityPage extends StatefulWidget {
  // const CityPage({super.key});

  // getState() async {
  //   var response =  await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=Vegetarian"));
  //   return jsonDecode(response.body);
  // }

  @override
  // State<CityPage> createState() => _CityPageState();
  State<StatefulWidget> createState() {
    return _CityPage();
  }
}

class _CityPage extends State<CityPage> {
  final List<Space> _Space = [];
  Future<List<Space>> fetchJson() async {
    var response = await http
        // .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
        .get(Uri.parse('http://api-siger.uacak.com/api/v1/state'));
    print(response);
    List<Space> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      print(urjson);
      for (var jsondata in urjson) {
        slist.add(Space.fromJson(jsondata));
      }
    }
    return slist;
  }

  @override
  void initState() {
    fetchJson().then((value) {
      setState(() {
        _Space.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var spaceProvider = Provider.of<SpaceProvider>(context);
    // spaceProvider..getSpace();
    // Future fetchSpace() async {
    //   var url = Uri.https('http://bwa-cozy.herokuapp.com/recommended-spaces');
    //   var response = await http.get(url);
    //   var spaces = [];
    // }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: ListView.builder(
                    itemCount: _Space.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ((AllKabupatenList()))));
                        // AllKabupatenList()));
                      },
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              // image: AssetImage(itemsfestifalbudaya[index].image),
                              image: NetworkImage(
                                  _Space[index].image.toString(),
                                  scale: 1.0),
                              // _Space[index].image_url.toString()),
                              // _Space[index].image.toString()),
                              fit: BoxFit.cover,
                              opacity: 0.8),
                        ),
                        child: Container(
                            child: Center(
                              child: Text(
                                _Space[index].state.toString(),
                                // _Space[index].name.toString(),
                                // _Space[index].state.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
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
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width * 0.2,
          child: FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: () => slideRightWidget(
              newPage: EmergencyPage(),
              context: context,
            ),
            // {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => EmergencyPage()));
            // },
            child: Image(
              image: AssetImage(
                'assets/icons/emergency.png',
              ),
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
