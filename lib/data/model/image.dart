import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class Image with _$Image {
  const factory Image({
    required int id,
    required String user,
    required String pageURL,
    required String tags,
    required String previewImageUrl,
    required String largeImageUrl,
  }) = _Image;

  factory Image.fromJson(Map<String, Object?> json) => _$ImageFromJson(json);
}
