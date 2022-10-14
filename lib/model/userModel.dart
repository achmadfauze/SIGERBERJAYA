class user {
  late String? userCode;
  late String? uid;
  late String? name;
  late String? image;
  late String? email;
  late String? createAt;

  user({
    this.userCode,
    this.uid,
    this.name,
    this.image,
    this.email,
    this.createAt,
  });

  factory user.fromJson(Map<String, dynamic> json) => user(
        userCode: json['userCode'].toString(),
        name: json['name'].toString(),
        image: json['image'].toString(),
        uid: json['uid'].toString(),
        email: json['email'].toString(),
        createAt: json['createAt'].toString(),
      );
}
