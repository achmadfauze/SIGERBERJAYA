final List<Map<String, dynamic>> itemsAll = [
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
];

class tour {
  late String tourCode;
  late String stateCode;
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

  tour({
    required this.tourCode,
    required this.stateCode,
    required this.name,
    required this.image,
    required this.locationName,
    required this.like,
    required this.comment,
    required this.createAt,
    required this.latitude,
    required this.longitude,
    required this.ticket,
    required this.description,
  });

  tour.fromJson(Map<String, dynamic> json) {
    tourCode = json['tourCode'].toString();
    name = json['name'].toString();
    locationName = json['locationName'].toString();
    image = json['image'].toString();
    like = json['like'].toString();
    comment = json['comment'].toString();
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    ticket = json['ticket'].toString();
    description = json['description'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tourCode'] = tourCode;
    data['name'] = name;
    data['locationName'] = locationName;
    data['image'] = image;
    data['like'] = like;
    data['comment'] = comment;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['ticket'] = ticket;
    data['description'] = description;
    return data;
  }
}

// class Address {
// String? street;
// String? suite;
// String? city;
// String? zipcode;
// Geo? geo;

// Address({this.street, this.suite, this.city, this.zipcode, this.geo});

// Address.fromJson(Map<String, dynamic> json) {
//   street = json['street'];
//   suite = json['suite'];
//   city = json['city'];
//   zipcode = json['zipcode'];
//   geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
// }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['street'] = this.street;
//     data['suite'] = this.suite;
//     data['city'] = this.city;
//     data['zipcode'] = this.zipcode;
//     if (this.geo != null) {
//       data['geo'] = this.geo?.toJson();
//     }
//     return data;
//   }
// }

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

// class Company {
//   String? name;
//   String? catchPhrase;
//   String? bs;

//   Company({this.name, this.catchPhrase, this.bs});

//   Company.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     catchPhrase = json['catchPhrase'];
//     bs = json['bs'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['catchPhrase'] = this.catchPhrase;
//     data['bs'] = this.bs;
//     return data;
//   }
// }
