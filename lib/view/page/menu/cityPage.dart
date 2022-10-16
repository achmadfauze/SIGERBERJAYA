import 'dart:convert';
import 'package:first_app/model/KabupatenModel.dart';
import 'package:first_app/view/page/detail/kabupaten/Kabupatendetail.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:http/http.dart' as http;

import '../../../model/theme.dart';
import '../../component/Emergency.dart';

class CityPage extends StatefulWidget {
  // const CityPage({super.key});
  String? uid;
  CityPage({this.uid});
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
        .get(Uri.parse('https://hiskia.xyz/api/v1/state'));
    // print(response);
    List<Space> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      // print(urjson);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kabupaten / Kota",
          style: regularTextStyle.copyWith(fontSize: 18, color: Colors.white),
        ), //title aof appbar
        backgroundColor: const Color(0xff00a877),
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
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => customAnimationWidget(
                      newPage: AllKabupatenList(
                        stateCode: _Space[index].stateCode,
                        state: _Space[index].state,
                        image: _Space[index].image.toString(),
                        uid: widget.uid,
                      ),
                      context: context,
                      transitionBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = 0.0;
                        var end = 1.0;
                        var curve = Curves.easeIn;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return ScaleTransition(
                          scale: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => (AllKabupatenList(
                    //         stateCode: _Space[index].stateCode,
                    //         state: _Space[index].state,
                    //         image: _Space[index].image.toString(),
                    //         uid: widget.uid,
                    //       )),
                    //     ),
                    //   );
                    //   // AllKabupatenList()));
                    // },
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            // image: AssetImage(itemsfestifalbudaya[index].image),
                            image: NetworkImage(_Space[index].image.toString(),
                                scale: 1.0),
                            // _Space[index].image_url.toString()),
                            // _Space[index].image.toString()),
                            fit: BoxFit.cover,
                            opacity: 0.8),
                      ),

                      // AllKabupatenList()));

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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black45,
                            ),
                            child: Center(
                              child: Text(
                                _Space[index].state.toString(),
                                // _Space[index].name.toString(),
                                // _Space[index].state.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: regularTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              )
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
          child: const Image(
            image: AssetImage(
              'assets/icons/emergency.png',
            ),
            height: 40,
          ),
        ),
      ),
    );
  }
}
