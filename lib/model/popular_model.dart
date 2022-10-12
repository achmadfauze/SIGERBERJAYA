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

class Space {
  late String tourCode;
  late String name;
  late String locationName;
  late String image;
  late String like;
  late String comment;

  Space(
      {required this.tourCode,
      required this.name,
      required this.image,
      required this.locationName,
      required this.like,
      required this.comment});

  factory Space.fromJson(Map<String, dynamic> json) => Space(
        tourCode: json['tourCode'],
        name: json['name'],
        image: json['image'].toString(),
        locationName: json['locationName'].toString(),
        like: json['like'],
        comment: json['comment'],
      );

  Map<String, dynamic> json() => {
        "tourcode": tourCode,
        "name": name,
        "locationName": locationName,
        "image": image,
        "like": like,
        "comment": comment,
      };
}
