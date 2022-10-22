import 'dart:convert';

import 'package:first_app/model/modelLayanan.dart';
import 'package:first_app/model/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

class ListLayanan extends StatefulWidget {
  String? url;
  ListLayanan({super.key, required this.Judul, this.url});
  final String Judul;

  @override
  State<ListLayanan> createState() => _ListLayananState();
}

class _ListLayananState extends State<ListLayanan> {
  final List<layanan> _layanan = [];
  Future<List<layanan>> fetchJson() async {
    var response = await http
        // .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
        .get(Uri.parse(widget.url.toString()));
    // print(response);
    List<layanan> slist = [];
    if (response.statusCode == 200) {
      var urjson = (json.decode(response.body));
      // print(urjson);
      for (var jsondata in urjson) {
        slist.add(layanan.fromJson(jsondata));
      }
    }
    return slist;
  }

  @override
  void initState() {
    fetchJson().then((value) {
      setState(() {
        _layanan.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyWidth = MediaQueryWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.Judul),
        actions: [
          IconButton(
              onPressed: () => launchUrl(
                  Uri.parse('https://www.google.com/maps'),
                  mode: LaunchMode.externalNonBrowserApplication),
              icon: Icon(Icons.map))
        ],
      ),
      body: Container(
        // padding: EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: _layanan.length,
            itemBuilder: (context, index) => ListItem(
                  bodyWidth: bodyWidth,
                  all_layanan: _layanan[index],
                )
            // children: [
            //   ListItem(bodyWidth: bodyWidth),
            //   ListItem(bodyWidth: bodyWidth),
            //   ListItem(bodyWidth: bodyWidth),
            //   ListItem(bodyWidth: bodyWidth),
            // ]
            ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  layanan? all_layanan;
  ListItem({Key? key, required this.bodyWidth, this.all_layanan})
      : super(key: key);

  final double bodyWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: (() {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) {
          //     return ();
          //   }),
          // );
        }),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 4,
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://api.siger.uacak.com/public/assets/uploads/${all_layanan!.image.toString()}',
                        alignment: Alignment.centerLeft,
                        // "https://picsum.photos/300/200",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10, top: 2, bottom: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              all_layanan!.name.toString(),
                              style: regularTextStyle.copyWith(
                                fontSize: 16,
                                letterSpacing: 1.0,
                                height: 1.2,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 0,
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.grey[600],
                                        size: 18,
                                      )),
                                  Expanded(
                                    flex: 9,
                                    child: InkWell(
                                      onTap: () =>
                                          MapsLauncher.launchCoordinates(
                                        double.parse(all_layanan!.latitude),
                                        double.parse(all_layanan!.longitude),
                                        all_layanan!.name.toString(),
                                      ),
                                      child: Text(
                                        all_layanan!.locationName.toString(),
                                        style: regularTextStyle.copyWith(
                                            fontSize: 14,
                                            color: Colors.grey[600]),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                // padding: EdgeInsets.symmetric(horizontal: 20),
                                child: ConstrainedBox(
                                  constraints:
                                      BoxConstraints.tightFor(height: 25),
                                  child: ElevatedButton(
                                    child: Icon(
                                      Icons.phone,
                                      size: 16,
                                    ),
                                    onPressed: () {
                                      launchUrlString(
                                          'tel:${all_layanan!.phoneCall.toString()}');
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: ConstrainedBox(
                                  constraints:
                                      BoxConstraints.tightFor(height: 25),
                                  child: ElevatedButton(
                                    child: Icon(
                                      Icons.message,
                                      size: 16,
                                    ),
                                    onPressed: () async {
                                      launchUrlString(
                                          'sms:${all_layanan!.phoneCall.toString()}');
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
