import 'package:freezed_annotation/freezed_annotation.dart';
part 'chibauji.freezed.dart';

@freezed
class ChibaUji with _$ChibaUji{
  const ChibaUji._();

  const factory ChibaUji({
    required int no,
    required String name,
    required String subtitle,
    required String image,
    required bool favorite,
    required double lat,
    required double lng,
    required bool flag,
  }) = _ChibaUji;

  factory ChibaUji.fromJson(Map<String,dynamic>json){
    return ChibaUji(
      no: json['no'],
      name: json['name'],
      subtitle: json['subtitle'],
      image: json['image'],
      favorite: json['favorite'],
      lat: json['lat'],
      lng: json['lng'],
      flag: json['flag'],
    );
 }
 Map<String,dynamic> toJson() {
    return{
      'no': no,
      'name': name,
      'subtitle': subtitle,
      'image': image,
      'favorite': favorite,
      'lat': lat,
      'lng': lng,
      'flag': flag,
    };
 }
}