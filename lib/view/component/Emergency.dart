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
            title: Text("Tombol Darurat"), //title aof appbar
            backgroundColor: Color(0xff00a877),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/panic1.png'),
                ),
              ),
              Row(
                children: [
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 150,
                      child: Image.asset('assets/panic2.png'),
                    ),
                  )
                  // SizedBox(
                  //   height: 100,
                  //   width: 150,
                  //   child: Image.asset('assets/panic3.png'),
                  // )
                ],
              ),
            ],
          ),
        ));
  }
}
