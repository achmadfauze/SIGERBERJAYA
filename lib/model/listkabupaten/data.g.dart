// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      stateCode: json['stateCode'] as int,
      kabupaten: json['kabupaten'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'stateCode': instance.stateCode,
      'kabupaten': instance.kabupaten,
      'image': instance.image,
    };
