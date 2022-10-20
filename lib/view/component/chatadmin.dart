import 'package:first_app/model/chatModel.dart';
import 'package:first_app/model/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatAdmin extends StatefulWidget {
  String? uid;
  ChatAdmin({super.key, this.uid});

  @override
  State<ChatAdmin> createState() => _ChatAdminState();
}

class _ChatAdminState extends State<ChatAdmin> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;
  final List<chatAdmin> com = [];
  Future<List<chatAdmin>> fetchJson() async {
    var response = await http.get(Uri.parse(
        'https://api.siger.uacak.com/public/api/v1/liketourchat/${widget.uid}'));
    List<chatAdmin> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      for (var jsondata in urjson) {
        slist.add(chatAdmin.fromJson(jsondata));
      }
    }
    return slist;
  }

  Future<http.Response> createChat(String from, String to, String chat) {
    return http.post(
      Uri.parse('https://api.siger.uacak.com/public/api/v1/chat'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"from": from, "to": to, "chat": chat}),
    );
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    fetchJson().then((value) {
      setState(() {
        com.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController chatController = new TextEditingController();
    ScrollController _scrollController = new ScrollController();

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
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 15),
                controller: _scrollController,
                itemCount: com.length,
                itemBuilder: ((context, index) {
                  chatAdmin? cht = com[index];
                  if (cht.from == widget.uid) {
                    return admin(
                      cht: cht,
                    );
                  }
                  return userchat(
                    cht: cht,
                  );
                }),
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(edge),
                child: TextField(
                  controller: chatController,
                  autofocus: false,
                  style: regularTextStyle.copyWith(
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    suffixIcon: InkWell(
                      child: Icon(Icons.send),
                      onTap: () {
                        if (_currentUser != null) {
                          chatAdmin val = new chatAdmin(
                              from: widget.uid,
                              to: "1",
                              chat: chatController.text,
                              createAt: "now");
                          // print(val);
                          createChat(
                            widget.uid.toString(),
                            "1",
                            chatController.text,
                          );
                          FocusScope.of(context).requestFocus(new FocusNode());
                          setState(() {
                            com.add(val);
                          });
                          _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 500));
                        }
                      },
                    ),
                    hintText: 'Masukkan Pesan',
                    hintStyle: regularTextStyle.copyWith(fontSize: 14),
                    contentPadding: const EdgeInsets.only(
                      left: 14.0,
                      // bottom: 3.0, top: 3.0
                    ),
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
  chatAdmin? cht;
  userchat({Key? key, this.cht}) : super(key: key);

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
          cht!.createAt.toString(),
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
        title: Text(cht!.chat.toString(),
            style: regularTextStyle.copyWith(fontSize: 14)),
      ),
    );
  }
}

class admin extends StatelessWidget {
  chatAdmin? cht;
  admin({
    this.cht,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: edge, left: 100, right: edge),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        tileColor: Colors.white,
        title: Text(
          cht!.chat.toString(),
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
          cht!.createAt.toString(),
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
