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

  tour(
      {required this.tourCode,
      required this.stateCode,
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

  factory tour.fromJson(Map<String, dynamic> json) => tour(
      tourCode: json['tourCode'].toString(),
      stateCode: json['stateCode'].toString(),
      name: json['name'].toString(),
      image: json['image'].toString(),
      locationName: json['locationName'].toString(),
      like: json['like'].toString(),
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
