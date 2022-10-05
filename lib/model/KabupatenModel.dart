class Space {
  late String stateCode;
  late String state;
  late String image;

  Space({
    required this.stateCode,
    required this.state,
    required this.image,
  });

  factory Space.fromJson(Map<String, dynamic> json) => Space(
        stateCode: json['stateCode'],
        state: json['state'],
        image: json['image'],
      );

  Map<String, dynamic> json() => {
        "stateCode": stateCode,
        "state": state,
        "image": image,
      };
}
// class Space {
//   late int id;
//   late String name;
//   late String image_url;

//   Space({
//     required this.id,
//     required this.name,
//     required this.image_url,
//   });

//   factory Space.fromJson(Map<String, dynamic> json) => Space(
//         id: json['id'],
//         name: json['name'],
//         image_url: json['image_url'],
//       );

//   Map<String, dynamic> json() => {
//         "id": id,
//         "name": name,
//         "image_url": image_url,
//       };
// }
// class Space {
//   late int stateCode;
//   late String state;
//   late String image;

//   Space({
//     required this.stateCode,
//     required this.state,
//     required this.image,
//   });

//   factory Space.fromJson(Map<String, dynamic> json) => Space(
//         stateCode: json['stateCode'],
//         state: json['state'],
//         image: json['image_url'],
//       );

//   Map<String, dynamic> json() => {
//         "stateCode": stateCode,
//         "state": state,
//         "image_url": image,
//       };
// }

// final List<Map<String, dynamic>> ItemsKabupaten = [
//   {
//     "Name": "Kabupaten Lampung Barat",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Lampung Selatan",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Lampung Tengah",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Lampung Timur",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Lampung Utara",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Mesuji",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Pesawaran",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Pesisir Barat",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Pringsewu",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Tanggamus",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Tulang Bawang",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Tulang Bawang Barat",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kabupaten Way Kanan",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kota Bandar Lampung",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
//   {
//     "Name": "Kota Metro Lampung",
//     "Image":
//         "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
//   },
// ];
