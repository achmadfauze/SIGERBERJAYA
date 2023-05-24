import 'package:first_app/model/commentModel.dart';
import 'package:first_app/model/theme.dart';
import 'package:first_app/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Comment extends StatefulWidget {
  String? uid, tourCode;
  Comment({super.key, this.uid, this.tourCode});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
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
        'https://api.siger.uacak.com/public/api/v1/commenttour/${widget.tourCode}'));
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
      String comment, String uid, String tourCode) {
    return http.post(
      Uri.parse('https://api.siger.uacak.com/public/api/v1/commenttour'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "comment": comment,
        "userCode": uid,
        "tourCode": tourCode
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
                  uid: widget.uid,
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
                              widget.tourCode.toString());

                          setState(() {
                            com.insert(0, val);
                          });
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
  String? uid;
  comment({Key? key, this.uid, this.com}) : super(key: key);

  TextEditingController reportController = new TextEditingController();

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
              // Text(com!.createAt.toString(),
              //     style: regularTextStyle.copyWith(fontSize: 12)),
              InkWell(
                child: Icon(
                  Icons.flag,
                  size: 20,
                ),
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isDismissible: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: ((context) {
                      return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Report(
                            uid: uid,
                            ctCode: com!.ctCode.toString(),
                          ));
                    }),
                  );
                },
              )
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(com!.createAt.toString(),
                  style: regularTextStyle.copyWith(fontSize: 12)),
              SizedBox(
                height: 10,
              ),
              Text(com!.comment.toString(),
                  style: regularTextStyle.copyWith(fontSize: 14)),
            ],
          ),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(com!.image.toString()),
              ),
            ),
          )),
    );
  }
}

class Report extends StatefulWidget {
  final String? uid;
  final String? ctCode;
  Report({Key? key, this.uid, this.ctCode}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  // Report({this.ctCode});
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  Future<http.Response> createReport(String text, String uid, String ctCode) {
    return http.post(
      Uri.parse('https://api.siger.uacak.com/public/api/v1/createtourreport'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"text": text, "userCode": uid, "ctCode": ctCode}),
    );
  }

  String text1 = "Komentar tidak pantas";
  String text2 = "Komentar mengandung SARA";
  String text3 = "Komentar Mengandung ujaran kebencian";
  @override
  Widget build(BuildContext context) {
    TextEditingController reportController = TextEditingController();
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: InkWell(
                child: Text(
                  text1,
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () async {
                  await createReport(
                    text1,
                    _currentUser != null ? _currentUser!.id.toString() : "",
                    widget.ctCode!,
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Berhasil melaporkan")));
                }),
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: InkWell(
                  child: Text(
                    text3,
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () async {
                    await createReport(
                      text3,
                      _currentUser != null ? _currentUser!.id.toString() : "",
                      widget.ctCode!,
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Berhasil melaporkan")));
                  })),
          Padding(
              padding: EdgeInsets.all(20),
              child: InkWell(
                  child: Text(
                    text2,
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () async {
                    await createReport(
                      text2,
                      _currentUser != null ? _currentUser!.id.toString() : "",
                      widget.ctCode!,
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Berhasil melaporkan")));
                  })),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: TextField(
              controller: reportController,
              autofocus: false,
              style: TextStyle(
                fontSize: 15.0,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                // suffixIcon: Icon(Icons.send),
                suffixIcon: InkWell(
                    child: Icon(Icons.send),
                    onTap: () async {
                      await createReport(
                        reportController.text,
                        _currentUser != null ? _currentUser!.id.toString() : "",
                        widget.ctCode!,
                      );
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Berhasil melaporkan")));
                    }),
                hintText: 'Alasan Melaporkan',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 3.0, top: 3.0),
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
          )
        ],
      ),
    );
  }
}
