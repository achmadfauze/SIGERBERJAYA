// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:first_app/model/KabupatenModel.dart';

// class SpaceProvider extends ChangeNotifier {
//   getSpace() async {
//     var result =
//         await http.get(Uri.parse('http:api-siger.uacak.com/api/v1/state'));
//     print(result.statusCode);
//     print(result.body);

//     if (result.statusCode == 200) {
//       List data = jsonDecode(result.body);
//       // List<Space> spaces = data.map((items) => Space.fromJson(items)).toList();
//       List<Statee> spaces = data.map((item) => Statee.fromJson(item)).toList();
//       return spaces;
//     } else {
//       return <Statee>[];
//     }
//   }
// }
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:first_app/model/KabupatenModel.dart';

// class SpaceProvider extends ChangeNotifier {
//   getSpace() async {
//     var result = await http
//         // .get(Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'));
//         .get(Uri.parse('http://api-siger.uacak.com/api/v1/state'));
//     print(result.statusCode);
//     print(result.body);

//     if (result.statusCode == 200) {
//       List data = jsonDecode(result.body);
//       // List<Space> spaces = data.map((items) => Space.fromJson(items)).toList();
//       List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
//       return spaces;
//     } else {
//       return <Space>[];
//     }
//   }
// }
