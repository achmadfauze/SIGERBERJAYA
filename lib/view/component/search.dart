import 'package:flutter/material.dart';

import 'package:first_app/model/API_wisata.dart';
import 'package:first_app/model/modelAll.dart';

class SearchUser extends SearchDelegate {
  FetchSpace _userList = FetchSpace();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
      child: FutureBuilder<List<Space>>(
          future: _userList.getspace(query: query),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
              // print("");
            }
            List<Space>? data = snapshot.data;
            return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 200,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          // image: AssetImage(itemsfestifalbudaya[index].image),
                          image: NetworkImage(
                              "${itemsAll[index]['Image']}".toString(),
                              scale: 1),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             DetailPlace(space: space)));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(28),
                                          topRight: Radius.circular(10)),
                                      color: Colors.black.withOpacity(0.5),
                                      // color: Color.fromARGB(157, 222, 238, 5)
                                    ),
                                    height: 40,
                                    width: 100,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.favorite,
                                            size: 22,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            // _Space[index].like.toString(),
                                            '${data?[index].like}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Roboto-Regular',
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          const Icon(
                                            Icons.warning,
                                            size: 22,
                                            color: Colors.yellow,
                                          ),
                                        ]),
                                  ),
                                ]),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: Colors.black.withOpacity(0.5),
                                // color: Color.fromARGB(157, 222, 238, 5)
                              ),
                              height: 60,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // _Space[index].name.toString(),
                                      '${data?[index].name}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mulish-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          // _Space[index]
                                          //     .locationName
                                          //     .toString(),
                                          '${data?[index].name}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Mulish-Regular',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));

                  // return ListTile(
                  //   title: Row(
                  //     children: [
                  //       Container(
                  //         width: 60,
                  //         height: 60,
                  //         decoration: BoxDecoration(
                  //           color: Colors.deepPurpleAccent,
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         child: Center(
                  //           child: Text(
                  //             '${data?[index].tourCode}',
                  //             style: TextStyle(
                  //                 fontSize: 20,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.white),
                  //             overflow: TextOverflow.clip,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(width: 20),
                  //       Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               '${data?[index].name}',
                  //               style: TextStyle(
                  //                   fontSize: 18, fontWeight: FontWeight.w600),
                  //             ),
                  //             SizedBox(height: 10),
                  //             Text(
                  //               '${data?[index].email}',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ])
                  //     ],
                  //   ),
                  // );
                });
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Cari Tempat Wisata'),
    );
  }
}
