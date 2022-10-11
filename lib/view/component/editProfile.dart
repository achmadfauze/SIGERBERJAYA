import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final appBar = AppBar(
      title: Text("Edit Profile"),
      backgroundColor: Color(
        0xff00a877,
      ),
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
                      _currentUser!.photoUrl != null
                          ? _currentUser!.photoUrl.toString()
                          : "",
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
                      color: Color(0xff00a877),
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
              controller: TextEditingController(
                  text: _currentUser!.displayName != null
                      ? _currentUser!.displayName.toString()
                      : ""),
              decoration: InputDecoration(label: Text("Nama")),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: bodyHeight * 0.06,
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: bodyWidth * 0.25),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(
                    0xff00a877,
                  ),
                ),
              ),
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
