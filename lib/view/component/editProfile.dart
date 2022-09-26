import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final appBar = AppBar(
      title: Text("Edit Profile"),
    );
    final bodyHeight = MediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: ListView(
        padding: EdgeInsets.only(top: MediaQueryHeight * 0.1),
        children: [
          CircleAvatar(
            radius: bodyWidth * 0.25,
            backgroundColor: Colors.grey,
            child: Stack(
              children: [
                ClipOval(
                  child: new SizedBox(
                    width: bodyWidth * 0.5,
                    height: bodyWidth * 0.5,
                    child: Image.network(
                      "https://picsum.photos/200/200",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: -15,
                  child: RawMaterialButton(
                    // onPressed: () {},
                    onPressed: () async {
                      var picked = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowMultiple: false,
                          allowedExtensions: ['jpg', 'jpeg', 'png']);
                      if (picked != null) {
                        print(picked.files.first.name);
                      }
                    },
                    elevation: 2,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.camera_enhance_outlined,
                      color: Colors.blue,
                    ),
                    shape: CircleBorder(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: bodyHeight * 0.05, horizontal: bodyWidth * 0.05),
            child: TextField(
              controller:
                  TextEditingController(text: "Hiskia Perdamen Pulungan"),
              decoration: InputDecoration(label: Text("Nama")),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: bodyHeight * 0.06,
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: bodyWidth * 0.25),
            child: ElevatedButton(
              child: Text(
                "Perbaharui Profile",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
