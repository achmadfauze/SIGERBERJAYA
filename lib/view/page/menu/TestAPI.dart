import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:first_app/model/KabupatenModel.dart';
import 'package:first_app/model/listkabupaten/user.dart';
import 'package:first_app/view/page/detail/kabupaten/Kabupatendetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  // getState() async {
  //   var response =  await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=Vegetarian"));
  //   return jsonDecode(response.body);
  // }

  @override
  // State<CityPage> createState() => _CityPageState();
  State<StatefulWidget> createState() {
    return _TestPage();
  }
}

class _TestPage extends State<TestPage> {
  // final List<Space> _Space = [];
  // Future<List<Space>> fetchJson() async {
  //   var response = await http
  //       .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
  //   // .get(Uri.parse('http://192.168.0.87:8080/api/v1/state'));
  //   print(response);
  //   List<Space> slist = [];

  //   if (response.statusCode == 200) {
  //     var urjson = json.decode(response.body);
  //     for (var jsondata in urjson) {
  //       slist.add(Space.fromJson(jsondata));
  //     }
  //   }
  //   return slist;
  // }

  Future<UserModel?> getDataUser() async {
    Uri url = Uri.parse("http://api-siger.uacak.com/api/v1/state");
    var response = await http.get(url);

    print(response.statusCode);
    if (response.statusCode != 200) {
      print("Tidak bisa mendapatkan data");
      return null;
    } else {
      print(response.body);
      Map<String, dynamic> data =
          (json.decode(response.body) as Map<String, dynamic>)['data']['state'];
      return UserModel.fromJson(data);
    }
  }

  // @override
  // void initState() {
  //   fetchJson().then((value) {
  //     setState(() {
  //       _Space.addAll(value);
  //     });
  //   });
  //   super.initState();
  // }

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
          body: FutureBuilder<UserModel?>(
              future: getDataUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 12, right: 12, top: 12),

                        // child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllKabupatenList()));
                              },
                              child: ListView.builder(
                                itemCount: 2,
                                // {snapshot.data!.data}.length,
                                // snapshot.data.length,
                                // snapshot.length,
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
                                            "https://cdn.shockoe.com/wp-content/uploads/2018/05/30115113/asset-invenotry-apps-in-record-time-flutter.jpeg"
                                            // snapshot.data!.data.avatar
                                            ),
                                        // _Space[index].image.toString()),
                                        fit: BoxFit.cover,
                                        opacity: 0.8),
                                  ),
                                  child: Container(
                                      child: Center(
                                        child: Text(
                                          '${snapshot.data!.data.kabupaten}',
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
                            ))
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(child: Text("TIDAK ADA DATA"));
                  }
                }
              }),
        ));
  }
}
// import 'dart:convert';

// import 'package:provider/provider.dart';
// import 'package:first_app/model/KabupatenModel.dart';
// import 'package:first_app/model/listkabupaten/user.dart';
// import 'package:first_app/view/page/detail/kabupaten/Kabupatendetail.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class TestPage extends StatefulWidget {
//   const TestPage({super.key});

//   // getState() async {
//   //   var response =  await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=Vegetarian"));
//   //   return jsonDecode(response.body);
//   // }

//   @override
//   // State<CityPage> createState() => _CityPageState();
//   State<StatefulWidget> createState() {
//     return _TestPage();
//   }
// }

// class _TestPage extends State<TestPage> {
//   // final List<Space> _Space = [];
//   // Future<List<Space>> fetchJson() async {
//   //   var response = await http
//   //       .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
//   //   // .get(Uri.parse('http://192.168.0.87:8080/api/v1/state'));
//   //   print(response);
//   //   List<Space> slist = [];

//   //   if (response.statusCode == 200) {
//   //     var urjson = json.decode(response.body);
//   //     for (var jsondata in urjson) {
//   //       slist.add(Space.fromJson(jsondata));
//   //     }
//   //   }
//   //   return slist;
//   // }

//   Future<UserModel?> getDataUser() async {
//     Uri url = Uri.parse("https://reqres.in/api/users/2");
//     var response = await http.get(url);

//     print(response.statusCode);
//     if (response.statusCode != 200) {
//       print("Tidak bisa mendapatkan data");
//       return null;
//     } else {
//       print(response.body);
//       Map<String, dynamic> data =
//           (json.decode(response.body) as Map<String, dynamic>);
//       return UserModel.fromJson(data);
//     }
//   }

//   // @override
//   // void initState() {
//   //   fetchJson().then((value) {
//   //     setState(() {
//   //       _Space.addAll(value);
//   //     });
//   //   });
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // var spaceProvider = Provider.of<SpaceProvider>(context);
//     // spaceProvider..getSpace();
//     // Future fetchSpace() async {
//     //   var url = Uri.https('http://bwa-cozy.herokuapp.com/recommended-spaces');
//     //   var response = await http.get(url);
//     //   var spaces = [];
//     // }

//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text("Kabupaten / Kota"), //title aof appbar
//             backgroundColor: Color(0xff00a877),
//           ),
//           // color: Color(0xffB4D6EF),
//           body: FutureBuilder<UserModel?>(
//               future: getDataUser(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else {
//                   if (snapshot.hasData) {
//                     return SingleChildScrollView(
//                       child: Padding(
//                         padding:
//                             const EdgeInsets.only(left: 12, right: 12, top: 12),

//                         // child: Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                                 child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             AllKabupatenList()));
//                               },
//                               child: ListView.builder(
//                                 itemCount: 2,
//                                 // {snapshot.data!.data}.length,
//                                 // snapshot.data.length,
//                                 // snapshot.length,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) => Container(
//                                   height: 180,
//                                   width: double.infinity,
//                                   margin: EdgeInsets.only(bottom: 8),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     image: DecorationImage(
//                                         // image: AssetImage(itemsfestifalbudaya[index].image),
//                                         image: NetworkImage(
//                                             snapshot.data!.data.avatar),
//                                         // _Space[index].image.toString()),
//                                         fit: BoxFit.cover,
//                                         opacity: 0.8),
//                                   ),
//                                   child: Container(
//                                       child: Center(
//                                         child: Text(
//                                           '${snapshot.data!.data.first_name}',
//                                           // _Space[index].name.toString(),
//                                           // _Space[index].state.toString(),
//                                           maxLines: 2,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: const TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: 'Mulish-Regular',
//                                             fontSize: 24,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Colors.black45,
//                                       )),
//                                 ),
//                               ),
//                             ))
//                           ],
//                         ),
//                       ),
//                     );
//                   } else {
//                     return Center(child: Text("TIDAK ADA DATA"));
//                   }
//                 }
//               }),
//         ));
//   }
// }
