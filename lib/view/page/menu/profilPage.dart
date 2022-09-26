import 'package:first_app/view/component/editBahasa.dart';
import 'package:first_app/view/component/editProfile.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool notif = false;

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    final appBar = AppBar(
      title: Text("Profil"),
    );
    final bodyHeight = MediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(top: bodyHeight * 0.05),
          children: [
            CircleAvatar(
              radius: bodyWidth * 0.25,
              backgroundColor: Colors.grey,
              child: ClipOval(
                child: Column(
                  children: [
                    new SizedBox(
                      width: bodyWidth * 0.5,
                      height: bodyWidth * 0.5,
                      child: Image.network(
                        "https://picsum.photos/200/200",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: bodyHeight * 0.05),
              child: Text(
                "Hiskia Perdamen Pulungan",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20 + (bodyHeight * 0.01)),
              ),
            ),
            //profile
            Padding(
              padding: EdgeInsets.only(
                  top: bodyHeight * 0.05, left: bodyWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("hiski46@gmail.com"),
                    leading: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text("25-09-2022"),
                    leading: Icon(
                      Icons.watch_later_sharp,
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text("Edit Profile"),
                    leading: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return EditProfile();
                          }),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Keluar"),
                    leading: Icon(
                      Icons.logout,
                      color: Colors.blue,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: bodyHeight * 0.05, left: bodyWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengaturan Umum",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    title: Text("Dapatkan Pemberitahuan"),
                    leading: Icon(
                      Icons.notifications,
                      color: Colors.blue,
                    ),
                    trailing: Switch(
                      value: notif,
                      onChanged: (value) {
                        setState(() {
                          notif = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Bahasa"),
                    leading: Icon(
                      Icons.language,
                      color: Colors.blue,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return EditBahasa();
                          }),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
