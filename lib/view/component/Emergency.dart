import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
// ignore: depend_on_referenced_packages

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  // State<CityPage> createState() => _CityPageState();
  State<StatefulWidget> createState() {
    return _EmergencyPage();
  }
}

class _EmergencyPage extends State<EmergencyPage> {
  // TextEditingController _numberCtrl = new TextEditingController();

  //     @override
  //     void initState() {
  //       super.initState();
  //       _numberCtrl.text = "085921191121";
  //     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Tombol Darurat"), //title aof appbar
        backgroundColor: Color(
          0xff00a877,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: InkWell(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/panic1.png'),
              ),
              onTap: () async {
                launchUrlString('tel:0721110');
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: SizedBox(
                  height: 100,
                  width: 150,
                  child: Image.asset('assets/panic2.png'),
                ),
                onTap: () async {
                  launchUrlString('tel:0721110');
                },
              ),
              InkWell(
                child: SizedBox(
                  height: 100,
                  width: 150,
                  child: Image.asset('assets/panic3.png'),
                ),
                onTap: () async {
                  launchUrlString('tel:0721119');
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
