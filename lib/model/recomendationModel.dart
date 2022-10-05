final List<Map<String, dynamic>> itemsRecomendation = [
  {
    "Name": "Slanik Waterpark",
    "Liked": "32",
    "Comment": "1",
    "Address": "Way Halim Bandar Lampung, Kota Bandar Lampung",
    "Desc":
        "Slanik Waterpark merupakan salah satu wahana wisata terfavorit bagi anak-anak di kota bandar lampung",
    "Image":
        "https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2000644192688/Slanik%2520Waterpark%2520Lampung%2520Tickets-d8259893-cdab-48da-91d2-6e0b365cc045.jpeg?_src=imagekit&tr=dpr-2"
  },
  {
    "Name": "Labuhan Jukung Krui",
    "Liked": "13",
    "Comment": "4",
    "Address": "Way Halim Bandar Lampung, Kota Bandar Lampung",
    "Desc":
        "Pantai Labuhan Jukung krui adalah tempat terfavorit bagi kaum peselancar dikarenakan ombak yang sangat mendukung",
    "Image":
        "https://www.tourismvaganza.com/wp-content/uploads/2017/04/Krui-Credit-to-Cabana-1.jpeg"
  },
  {
    "Name": "Wira Garden",
    "Liked": "12",
    "Comment": "3",
    "Address": "Way Halim Bandar Lampung, Kota Bandar Lampung",
    "Desc":
        "Wira Garden salah satu objek wisata yang cocok bagi anda sang pecinta alam",
    "Image":
        "https://t-2.tstatic.net/tribunlampungtravel/foto/bank/images/Rute-Menuju-Destinasi-Glamping-di-Wira-Garden.jpg",
  },
  {
    "Name": "Pantai Batu Karang",
    "Liked": "24",
    "Comment": "0",
    "Address": "Way Halim Bandar Lampung, Kota Bandar Lampung",
    "Desc": "Pantai Batu Karang sangat cocok untuk berfoto ala-ala selebgram ",
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
        "tourode": tourCode,
        "name": name,
        "lokationName": locationName,
        "image": image,
        "like": like,
        "comment": comment,
      };
}
