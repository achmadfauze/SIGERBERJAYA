import 'package:first_app/model/theme.dart';
import 'package:flutter/material.dart';

class ChatAdmin extends StatefulWidget {
  const ChatAdmin({super.key});

  @override
  State<ChatAdmin> createState() => _ChatAdminState();
}

class _ChatAdminState extends State<ChatAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 228, 228),
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.person_sharp),
              SizedBox(
                width: 6,
              ),
              Text(
                "Chat Admin",
                style: regularTextStyle.copyWith(
                    fontSize: 18, color: Colors.white),
              ),
            ],
          ), //title aof appbar
          backgroundColor: const Color(0xff00a877),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView(
                children: [
                  userchat(),
                  admin(),
                  userchat(),
                  admin(),
                ],
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(edge),
                child: TextField(
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    suffixIcon: Icon(Icons.send),
                    hintText: 'Search',
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 3.0, top: 3.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class userchat extends StatelessWidget {
  const userchat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: edge, left: edge, right: 100),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        tileColor: Colors.white,
        subtitle: Text(
          "2022-12-01 16:50:02",
          style: regularTextStyle.copyWith(fontSize: 12),
          textAlign: TextAlign.right,
        ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Flexible(
        //       child: Text(
        //         "Nama ajasjkajjkaakskajkajkjaj",
        //         style: regularTextStyle.copyWith(fontSize: 16),
        //         maxLines: 1,
        //         overflow: TextOverflow.ellipsis,
        //       ),
        //     ),
        //     Text("02-12-2020",
        //         style: regularTextStyle.copyWith(fontSize: 12)),
        //   ],
        // ),
        title: Text(
            "keren bangett.Tempat ini cocok untuk menjadi objek wisata liburan bersama keluarga tercinta",
            style: regularTextStyle.copyWith(fontSize: 14)),
      ),
    );
  }
}

class admin extends StatelessWidget {
  const admin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: edge, left: 100, right: edge),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        tileColor: Colors.white,
        title: Text(
          "keren bangett.Tempat ini cocok untuk menjadi objek wisata liburan bersama keluarga tercinta",
          style: regularTextStyle.copyWith(fontSize: 14),
          textAlign: TextAlign.left,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       "02-12-2020",
        //       style: regularTextStyle.copyWith(fontSize: 12),
        //     ),
        //     Text(
        //       "Admin",
        //       style: regularTextStyle.copyWith(fontSize: 16),
        //     ),
        //   ],
        // ),
        subtitle: Text(
          "2022-12-01 17:00:01",
          style: regularTextStyle.copyWith(fontSize: 12),
          textAlign: TextAlign.right,
        ),
        // trailing: Container(
        //   width: 50,
        //   height: 50,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     //color: Colors.green,
        //     image: DecorationImage(
        //       fit: BoxFit.cover,
        //       image: NetworkImage(
        //           "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
        //           // _currentUser == null
        //           //     ? ""
        //           //     : _currentUser!.photoUrl.toString(),
        //           ),
        //     ),
        //   ),
        // )
        // Icon(
        //   Icons.login,
        // ),
        // trailing: Text("01-02-2020",
        //     style: regularTextStyle.copyWith(fontSize: 12)),
      ),
    );
  }
}
