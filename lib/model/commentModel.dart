class commentTour {
  String? ctCode, comment, userCode, tourCode, createAt, name, image;

  commentTour(
      {this.ctCode,
      this.comment,
      this.userCode,
      this.tourCode,
      this.createAt,
      this.name,
      this.image});

  factory commentTour.fromJson(Map<String, dynamic> json) => commentTour(
        ctCode: json['ctCode'].toString(),
        comment: json['comment'].toString(),
        userCode: json['userCode'].toString(),
        tourCode: json['tourCode'].toString(),
        createAt: json['createAt'].toString(),
        name: json['name'].toString(),
        image: json['image'].toString(),
      );
}
