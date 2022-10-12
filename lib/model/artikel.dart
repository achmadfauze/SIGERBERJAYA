final List<Map<String, dynamic>> itemsArtikel = [
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

// class Space {
//   late String stateCode;
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
//         image: json['image'],
//       );

//   Map<String, dynamic> json() => {
//         "stateCode": stateCode,
//         "state": state,
//         "image": image,
//       };
// }

class Space {
  late String articleCode;
  late String title;
  late String description;
  // late String image;
  late String like;
  late String comment;
  late String createAt;

  Space(
      {required this.articleCode,
      required this.title,
      // required this.image,
      required this.description,
      required this.like,
      required this.comment,
      required this.createAt});

  factory Space.fromJson(Map<String, dynamic> json) => Space(
      articleCode: json['articleCode'],
      title: json['title'],
      // image: json['image'].toString(),
      description: json['description'].toString(),
      like: json['like'],
      comment: json['comment'],
      createAt: json['createAt']);

  Map<String, dynamic> json() => {
        "articlecode": articleCode,
        "title": title,
        "description": description,
        // "image": image,
        "like": like,
        "comment": comment,
        "createAt": createAt,
      };
}
