import 'package:domain/models/trip.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_photo_response.g.dart';

@JsonSerializable()
class SearchPhotoResponse {
  List<ResponsePhoto> photos;

  SearchPhotoResponse({
    required this.photos,
  });

  factory SearchPhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPhotoResponseToJson(this);
}

@JsonSerializable()
class ResponsePhoto {
  String photographer;

  @JsonKey(
    name: 'src',
    toJson: _toJson,
    fromJson: _fromJson,
  )
  String imageUrl;

  ResponsePhoto({
    required this.photographer,
    required this.imageUrl,
  });

  factory ResponsePhoto.fromJson(Map<String, dynamic> json) =>
      _$ResponsePhotoFromJson(json);

  Map<String, dynamic> toJson() => _$ResponsePhotoToJson(this);

  static Map<String, dynamic> _toJson(String value) => {'original': value};
  static String _fromJson(Map<String, dynamic> value) =>
      value['original'] as String;

  Trip toTrip() {
    return Trip(
      destination: photographer,
      date: DateTime.now(),
      imageUrl: imageUrl,
    );
  }
}
