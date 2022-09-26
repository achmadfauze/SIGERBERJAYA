import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditBahasa extends StatelessWidget {
  const EditBahasa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Bahasa")),
        body: ListView(
          padding: EdgeInsets.only(top: 20, left: 10),
          children: [
            ListTile(
              title: Text("Indonesia"),
              leading: Icon(Icons.language),
              onTap: (() {}),
            ),
            ListTile(
              title: Text("Inggris"),
              leading: Icon(Icons.language),
              onTap: (() {}),
            ),
          ],
        ));
  }
}
