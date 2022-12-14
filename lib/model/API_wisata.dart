import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:first_app/model/tourModel.dart';

class FetchSpace {
  // var data = [];
  // List<tour> results = [];
  // // String urlList = 'https://jsonplaceholder.typicode.com/users/';
  // String urlList = 'https://api.siger.uacak.com/public/api/v1/tour';
  // // Future<List<Space>> getspace({String? query}) async {
  // // var response = await http
  // //       // .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
  // //       .get(Uri.parse(
  // //           'http://api-siger.uacak.com/public/api/v1/populertour/5'));
  // //   print(response);
  // //   List<Space> slist = [];
  // //   try {
  // //     // var response = await http.get(url);
  // //     print(response);
  // //     if (response.statusCode == 200) {
  // //       // data = json.decode(response.body);
  // //       var urjson = (json.decode(response.body));
  // //       // slist = urjson.map((e) => Space.fromJson(e)).toList();
  // //       for (var jsondata in urjson) {
  // //       slist.add(Space.fromJson(jsondata));
  // //     }
  // //       if (query != null) {
  // //         slist = slist
  // //             .where((element) =>
  // //                 element.name!.toLowerCase().contains((query.toLowerCase())))
  // //             .toList();
  // //       }
  // //     } else {
  // //       print("fetch error");
  // //     }
  // //   } on Exception catch (e) {
  // //     print('error: $e');
  // //   }
  // //   return slist;
  // // }

  // // @override
  // // void initState() {
  // //   getspace().then((value) {
  // //     setState(() {
  // //       _Space.addAll(value);
  // //     });
  // //   });
  // //   super.initState();
  // // }

  // Future<List<tour>> getspace({String? query}) async {
  //   var url = Uri.parse(urlList);

  //   try {
  //     var response = await http.get(url);
  //     print(response);
  //     if (response.statusCode == 200) {
  //       data = json.decode(response.body);
  //       results = data.map((e) => tour.fromJson(e)).toList();
  //       if (query != null) {
  //         results = results
  //             .where((element) =>
  //                 element.name!.toLowerCase().contains((query.toLowerCase())))
  //             .toList();
  //       }
  //     } else {
  //       print("fetch error");
  //     }
  //   } on Exception catch (e) {
  //     print('error: $e');
  //   }
  //   return results;
  // }
  // String Listtour = 'https://api.siger.uacak.com/public/api/v1/tour';
  final List<tour> _Tour = [];

  Future<List<tour>> fetchJson({String? query}) async {
    var response = await http
        .get(Uri.parse('https://api.siger.uacak.com/public/api/v1/tour'));
    List<tour> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      for (var jsondata in urjson) {
        slist.add(tour.fromJson(jsondata));
      }
      if (query != null) {
        slist = slist
            .where((element) =>
                element.name.toLowerCase().contains((query.toLowerCase())))
            .toList();
      }
    } else {
      print("fetch error");
    }
    return slist;
  }

  // @override
  // void initState() {
  //   fetchJson().then((value) {
  //     setState(() {
  //       _Tour.addAll(value);
  //     });
  //   });
  //   super.initState();
  // }

  // Future<List<tour>> gettour({String? query}) async {
  //   var url = Uri.parse(Listtour);
  //   try {
  //     var response = await http
  //         // .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
  //         .get(url);
  //     // print(response);
  //     // List<tour> slist = [];
  //     if (response.statusCode == 200) {
  //       _Tour = json.decode(response.body);
  //       _Tour = _Tour.map((e) => tour.fromJson(e)).toList();
  //       if (query != null) {
  //         _Tour = _Tour.where((element) =>
  //                 element.name!.toLowerCase().contains((query.toLowerCase())))
  //             .toList();
  //       }
  //     } else {
  //       print("fetch error");
  //     }
  //   } on Exception catch (e) {
  //     print('error: $e');
  //   }
  //   return _Tour;
  // }

  // // final List<Space> _Space = [];
  // var data = [];
  // List<Space> results = [];
  // String urli= 'http://api-siger.uacak.com/api/v1/tour';
  // Future<List<Space>> fetchJson() async {
  //   var url = Uri.parse(urli);
  //   try {
  //     var response = await http.get(url);
  //     print(response);
  //     if (response.statusCode == 200) {
  //       data = json.decode(response.body);
  //       results = data.map((e) => Space.fromJson(e)).toList();
  //       if (query != null) {
  //         results = results
  //             .where((element) =>
  //                 element.name!.toLowerCase().contains((query.toLowerCase())))
  //             .toList();
  //       }
  //     } else {
  //       print("fetch error");
  //     }
  //   } on Exception catch (e) {
  //     print('error: $e');
  //   }
  //   return results;
  // }

}
