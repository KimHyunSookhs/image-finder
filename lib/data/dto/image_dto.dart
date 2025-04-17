import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ImageDto {
  final num? id;
  final String? pageURL;
  final String? type;
  final String? tags;
  final String? previewURL;
  final num? previewWidth;
  final num? previewHeight;
  final String? webformatURL;
  final num? webformatWidth;
  final num? webformatHeight;
  final String? largeImageURL;
  final num? imageWidth;
  final num? imageHeight;
  final num? imageSize;
  final num? views;
  final num? downloads;
  final num? collections;
  final num? likes;
  final num? comments;
  final num? user_id;
  final String? user;
  final String? userImageURL;

  const ImageDto(
    this.id,
    this.pageURL,
    this.type,
    this.tags,
    this.previewURL,
    this.previewWidth,
    this.previewHeight,
    this.webformatURL,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageURL,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.user_id,
    this.user,
    this.userImageURL,
  );

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
}
