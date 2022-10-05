// import 'dart:convert';

// import 'package:provider/provider.dart';
// import 'package:first_app/model/KabupatenModel.dart';
// import 'package:first_app/view/page/detail/kabupaten/Kabupatendetail.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class TestPagee extends StatefulWidget {
//   // const CityPage({super.key});

//   // getState() async {
//   //   var response =  await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=Vegetarian"));
//   //   return jsonDecode(response.body);
//   // }

//   @override
//   // State<CityPage> createState() => _CityPageState();
//   State<StatefulWidget> createState() {
//     return _TestPagee();
//   }
// }

// class _TestPagee extends State<TestPagee> {
//   final List<Statee> _State = [];
//   Future<List<Statee>> fetchJson() async {
//     var response =
//         await http.get(Uri.https('api-siger.uacak.com/api/v1/state'));
//     // .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
//     // .get(Uri.parse('http://192.168.0.87:8080/api/v1/state'));
//     print(response);
//     List<Statee> slist = [];

//     if (response.statusCode == 200) {
//       var urjson = (json.decode(response.body));

//       for (var jsondata in urjson) {
//         slist.add(Statee.fromJson(jsondata));
//       }
//       print(urjson);
//     }
//     return slist;
//   }

//   @override
//   void initState() {
//     fetchJson().then((value) {
//       setState(() {
//         _State.addAll(value);
//       });
//     });
//     super.initState();
//   }

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
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Kabupaten / Kota"), //title aof appbar
//           backgroundColor: Color(0xff00a877),
//         ),
//         // color: Color(0xffB4D6EF),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 12, right: 12, top: 12),

//             // child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                     child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AllKabupatenList()));
//                   },
//                   child: ListView.builder(
//                     itemCount: 4,
//                     // _State.length,
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) => Container(
//                       height: 180,
//                       width: double.infinity,
//                       margin: EdgeInsets.only(bottom: 8),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                             // image: AssetImage(itemsfestifalbudaya[index].image),
//                             image: NetworkImage(_State[index].image.toString()),
//                             // _Space[index].image.toString()),
//                             fit: BoxFit.cover,
//                             opacity: 0.8),
//                       ),
//                       child: Container(
//                           child: Center(
//                             child: Text(
//                               _State[index].state.toString(),
//                               // _Space[index].state.toString(),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: 'Mulish-Regular',
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.black45,
//                           )),
//                     ),
//                   ),
//                 ))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeApi extends StatefulWidget {
  const HomeApi({Key? key}) : super(key: key);

  @override
  State<HomeApi> createState() => _HomeState();
}

class _HomeState extends State<HomeApi> {
  bool _loading = false;
  List<dynamic> _users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text(
            "API Call",
          ),
        ),
      ),
      body: _users.isNotEmpty
          ? ListView.builder(
              itemCount: _users.length,
              itemBuilder: ((context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          _users[index]['image'],
                          scale: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_users[index]['firstName']),
                            Text(_users[index]['email']),
                            Text(_users[index]['phone']),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
            )
          : Center(
              child: _loading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      child: const Text("fetch users"),
                      onPressed: loadUserList,
                    ),
            ),
    );
  }

  loadUserList() async {
    setState(() {
      _loading = true;
    });
    var res =
        await http.get(Uri.https("api-siger.uacak.com/api/v1/state", "data"));
    // var res = await http.get(Uri.https("dummyjson.com", "users"));
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      print(jsonData);
      if (jsonData['data'].isNotEmpty) {
        setState(() {
          _users = jsonData['data'];
          _loading = false;
        });
      }
    }
  }
}
