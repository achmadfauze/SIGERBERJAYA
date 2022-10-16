import 'package:first_app/model/theme.dart';
import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 228, 228),
        appBar: AppBar(
          title: Text(
            "Komentar",
            style: regularTextStyle.copyWith(fontSize: 18, color: Colors.white),
          ), //title aof appbar
          backgroundColor: const Color(0xff00a877),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView(
                children: [
                  comment(),
                  comment(),
                  comment(),
                  comment(),
                  comment(),
                  comment(),
                  comment(),
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

class comment extends StatelessWidget {
  const comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: edge, left: edge, right: edge),
      child: ListTile(
          tileColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Nama ajasjkajjkaakskajkajkjaj",
                  style: regularTextStyle.copyWith(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text("02-12-2020",
                  style: regularTextStyle.copyWith(fontSize: 12)),
            ],
          ),
          subtitle: Text(
              "keren bangett.Tempat ini cocok untuk menjadi objek wisata liburan bersama keluarga tercinta",
              style: regularTextStyle.copyWith(fontSize: 14)),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
                    // _currentUser == null
                    //     ? ""
                    //     : _currentUser!.photoUrl.toString(),
                    ),
              ),
            ),
          )
          // Icon(
          //   Icons.login,
          // ),
          // trailing: Text("01-02-2020",
          //     style: regularTextStyle.copyWith(fontSize: 12)),
          ),
    );
  }
}
