class commentArticle {
  String? caCode, comment, userCode, articleCode, createAt, name, image;

  commentArticle(
      {this.caCode,
      this.comment,
      this.userCode,
      this.articleCode,
      this.createAt,
      this.name,
      this.image});

  factory commentArticle.fromJson(Map<String, dynamic> json) => commentArticle(
        caCode: json['caCode'].toString(),
        comment: json['comment'].toString(),
        userCode: json['userCode'].toString(),
        articleCode: json['articleCode'].toString(),
        createAt: json['createAt'].toString(),
        name: json['name'].toString(),
        image: json['image'].toString(),
      );
}
