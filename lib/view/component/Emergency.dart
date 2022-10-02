import 'package:first_app/model/KabupatenModel.dart';
import 'package:first_app/model/recomendationModel.dart';
import 'package:first_app/view/page/detail/kabupaten/Kabupatendetail.dart';
import 'package:flutter/material.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  // State<CityPage> createState() => _CityPageState();
  State<StatefulWidget> createState() {
    return _EmergencyPage();
  }
}

class _EmergencyPage extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Keadaan Darurat"), //title aof appbar
            backgroundColor: Color(0xff00a877),
          ),
        ));
  }
}
