import 'package:first_app/model/commentModel.dart';
import 'package:first_app/model/theme.dart';
import 'package:first_app/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class CommentArticle extends StatefulWidget {
  String? uid, articleCode;
  CommentArticle({super.key, this.uid, this.articleCode});

  @override
  State<CommentArticle> createState() => _CommentArticleState();
}

class _CommentArticleState extends State<CommentArticle> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;
  final List<commentTour> com = [];
  Future<List<commentTour>> fetchJson() async {
    var response = await http.get(Uri.parse(
        'https://hiskia.xyz/api/v1/commentarticle/${widget.articleCode}'));
    List<commentTour> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      for (var jsondata in urjson) {
        slist.add(commentTour.fromJson(jsondata));
      }
    }
    return slist;
  }

  Future<http.Response> createComment(
      String comment, String uid, String articleCode) {
    return http.post(
      Uri.parse('https://hiskia.xyz/api/v1/commentarticle'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "comment": comment,
        "userCode": uid,
        "articleCode": articleCode
      }),
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
    TextEditingController commentController = new TextEditingController();

    dynamic currentTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 228, 228),
        appBar: AppBar(
          title: Text(
            "Komentar",
            style: regularTextStyle.copyWith(fontSize: 18, color: Colors.white),
          ), //title aof appbar
          backgroundColor: const Color(0xff00a877),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: com.length,
                itemBuilder: (context, index) => comment(
                  com: com[index],
                ),
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(edge),
                child: TextField(
                  controller: commentController,
                  autofocus: false,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    // suffixIcon: Icon(Icons.send),
                    suffixIcon: InkWell(
                      child: Icon(Icons.send),
                      onTap: () {
                        if (_currentUser != null) {
                          if (commentController.text != "") {
                            commentTour val = new commentTour(
                                comment: commentController.text,
                                createAt: currentTime,
                                name: _currentUser != null
                                    ? _currentUser!.displayName.toString()
                                    : "",
                                image: _currentUser != null
                                    ? _currentUser!.photoUrl.toString()
                                    : "");
                            // print(val);

                            createComment(
                                commentController.text,
                                _currentUser != null
                                    ? _currentUser!.id.toString()
                                    : "",
                                widget.articleCode.toString());
                            setState(() {
                              com.insert(0, val);
                            });
                          }
                        }
                      },
                    ),
                    hintText: 'Masukkan komentar',
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
  commentTour? com;
  comment({Key? key, this.com}) : super(key: key);

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
                  com!.name.toString(),
                  style: regularTextStyle.copyWith(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(com!.createAt.toString(),
                  style: regularTextStyle.copyWith(fontSize: 12)),
            ],
          ),
          subtitle: Text(com!.comment.toString(),
              style: regularTextStyle.copyWith(fontSize: 14)),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(com!.image.toString()
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
