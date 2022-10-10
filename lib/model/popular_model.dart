final List<Map<String, dynamic>> itemsPopular = [
  {
    "Name": "Pantai Batu Karang",
    "Liked": "2",
    "Comment": "0",
    "Date": "10 Maret 2022",
    "Desc":
        "Pantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu Karang",
    "Image":
        "https://cdn0-production-images-kly.akamaized.net/m-HxppUnYITVR8z1QAVSQsE90Sc=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1005140/original/081444800_1443597770-8.jpg"
  },
  {
    "Name": "Pantai Gigi Hiu",
    "Liked": "19",
    "Comment": "3",
    "Date": "10 Maret 2022",
    "Desc":
        "Pantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu Karang",
    "Image":
        "https://cdn.popbela.com/content-images/post/20200131/1000x6679-1b0e2274922249bf33b28ce274d87531_750x500.jpg"
  },
  {
    "Name": "Pantai Batu Karang",
    "Liked": "24",
    "Comment": "1",
    "Date": "10 Maret 2022",
    "Desc":
        "Pantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu Karang",
    "Image": "https://phinemo.com/wp-content/uploads/2021/03/beach-min-2.jpg"
  },
  {
    "Name": "Pantai Mutun",
    "Liked": "33",
    "Comment": "4",
    "Date": "10 Maret 2022",
    "Desc":
        "Pantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu KarangPantai Batu Karang",
    "Image":
        "https://cdn.popbela.com/content-images/post/20200131/1000x6679-1b0e2274922249bf33b28ce274d87531_750x500.jpg"
  }
];

class Populer {
  late String tourCode;
  late String name;
  late String locationName;
  late String image;
  late String like;
  late String comment;

  Populer(
      {required this.tourCode,
      required this.name,
      required this.image,
      required this.locationName,
      required this.like,
      required this.comment});

  factory Populer.fromJson(Map<String, dynamic> json) => Populer(
        tourCode: json['tourCode'],
        name: json['name'],
        image: json['image'].toString(),
        locationName: json['locationName'].toString(),
        like: json['like'],
        comment: json['comment'],
      );

  Map<String, dynamic> json() => {
        "tourode": tourCode,
        "name": name,
        "lokationName": locationName,
        "image": image,
        "like": like,
        "comment": comment,
      };
}
