final List<Map<String, dynamic>> itemsPopular = [
  {
    "Image":
        "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
  },
  {
    "Image":
        "https://cdn.popbela.com/content-images/post/20200131/1000x6679-1b0e2274922249bf33b28ce274d87531_750x500.jpg"
  },
  {"Image": "https://phinemo.com/wp-content/uploads/2021/03/beach-min-2.jpg"},
  {
    "Image":
        "https://cdn.popbela.com/content-images/post/20200131/1000x6679-1b0e2274922249bf33b28ce274d87531_750x500.jpg"
  },
  {"Image": "https://phinemo.com/wp-content/uploads/2021/03/beach-min-2.jpg"},
  {
    "Image":
        "https://cdn.popbela.com/content-images/post/20200131/1000x6679-1b0e2274922249bf33b28ce274d87531_750x500.jpg"
  }
];

class TourPop {
  late String tourCode;
  late String name;
  late String locationName;
  late String image;
  late String like;
  late String comment;
  late String createAt;
  late String latitude;
  late String longitude;
  late String condition;
  late String protocol;
  late String track;
  late String ticket;
  late String description;
  late String numberOfTourists;
  late String quotaOfTourists;
  late String isOpen;
  late String isSafety;
  late String traffic;

  TourPop(
      {required this.tourCode,
      required this.name,
      required this.image,
      required this.locationName,
      required this.like,
      required this.comment,
      required this.createAt,
      required this.latitude,
      required this.longitude,
      required this.condition,
      required this.protocol,
      required this.track,
      required this.ticket,
      required this.description,
      required this.numberOfTourists,
      required this.quotaOfTourists,
      required this.isOpen,
      required this.isSafety,
      required this.traffic});

  factory TourPop.fromJson(Map<String, dynamic> json) => TourPop(
      tourCode: json['tourCode'],
      name: json['name'],
      image: json['image'].toString(),
      locationName: json['locationName'].toString(),
      like: json['like'],
      comment: json['comment'].toString(),
      createAt: json['createAt'].toString(),
      latitude: json['latitude'].toString(),
      longitude: json['longitude'].toString(),
      condition: json['condition'].toString(),
      protocol: json['protocol'].toString(),
      track: json['track'].toString(),
      ticket: json['ticket'].toString(),
      description: json['description'].toString(),
      numberOfTourists: json['numberOfTourists'].toString(),
      quotaOfTourists: json['quotaOfTourists'].toString(),
      isOpen: json['isOpen'].toString(),
      isSafety: json['isSafety'].toString(),
      traffic: json['traffic'].toString());

  // Map<String, dynamic> json() => {
  //       "tourode": tourCode,
  //       "name": name,
  //       "lokationName": locationName,
  //       "image": image,
  //       "like": like,
  //       "comment": comment,
  //       "createAt": createAt,
  //     };
}

// class Space {
//   late String tourCode;
//   late String name;
//   late String locationName;
//   late String image;
//   late String like;
//   late String comment;
//   late String description;
//   late String ticket;

//   Space(
//       {required this.tourCode,
//       required this.name,
//       required this.image,
//       required this.locationName,
//       required this.like,
//       required this.comment,
//       required this.description,
//       required this.ticket});

//   factory Space.fromJson(Map<String, dynamic> json) => Space(
//       tourCode: json['tourCode'],
//       name: json['name'],
//       image: json['image'].toString(),
//       locationName: json['locationName'].toString(),
//       like: json['like'],
//       comment: json['comment'],
//       description: json['description'].toString(),
//       ticket: json['ticket'].toString());

//   Map<String, dynamic> json() => {
//         "tourcode": tourCode,
//         "name": name,
//         "locationName": locationName,
//         "image": image,
//         "like": like,
//         "comment": comment,
//         "description": description,
//         "ticket": ticket,
//       };
// }
