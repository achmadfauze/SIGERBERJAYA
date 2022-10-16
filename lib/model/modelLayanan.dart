class layanan {
  late String policeCode;
  late String hotelCode;
  late String restaurantCode;
  late String mfCode;
  late String stateCode;
  late String name;
  late String locationName;
  late String image;
  late String createAt;
  late String latitude;
  late String longitude;
  late String phoneCall;
  late String phoneSMS;
  late String description;

  layanan({
    required this.policeCode,
    required this.restaurantCode,
    required this.hotelCode,
    required this.mfCode,
    required this.stateCode,
    required this.name,
    required this.image,
    required this.locationName,
    required this.phoneCall,
    required this.phoneSMS,
    required this.createAt,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  factory layanan.fromJson(Map<String, dynamic> json) => layanan(
        policeCode: json['policeCode'].toString(),
        restaurantCode: json['resturantCode'].toString(),
        mfCode: json['mfCode'].toString(),
        hotelCode: json['hotelCode'].toString(),
        stateCode: json['stateCode'].toString(),
        name: json['name'].toString(),
        phoneCall: json['phoneCall'].toString(),
        phoneSMS: json['phoneSMS'].toString(),
        image: json['image'].toString(),
        locationName: json['locationName'].toString(),
        createAt: json['createAt'].toString(),
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
        description: json['description'].toString(),
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
