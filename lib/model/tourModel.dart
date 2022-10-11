class tour {
  late String tourCode;
  late String name;
  late String locationName;
  late String image;
  late String like;
  late String comment;
  late String createAt;

  tour({
    required this.tourCode,
    required this.name,
    required this.image,
    required this.locationName,
    required this.like,
    required this.comment,
    required this.createAt,
  });

  factory tour.fromJson(Map<String, dynamic> json) => tour(
        tourCode: json['tourCode'],
        name: json['name'],
        image: json['image'].toString(),
        locationName: json['locationName'].toString(),
        like: json['like'],
        comment: json['comment'],
        createAt: json['createAt'],
      );

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
