import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final int stateCode;
  final String kabupaten;
  final String image;
  // final String last_name;
  // final String avatar;

  Data({
    required this.stateCode,
    required this.kabupaten,
    required this.image,
    // required this.last_name,
    // required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
// import 'package:json_annotation/json_annotation.dart';

// part 'data.g.dart';

// @JsonSerializable()
// class Data {
//   final int id;
//   final String email;
//   final String first_name;
//   final String last_name;
//   final String avatar;

//   Data({
//     required this.id,
//     required this.email,
//     required this.first_name,
//     required this.last_name,
//     required this.avatar,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

//   Map<String, dynamic> toJson() => _$DataToJson(this);
// }
