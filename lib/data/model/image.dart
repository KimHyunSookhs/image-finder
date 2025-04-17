import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

part 'image.g.dart';

@freezed
abstract class Image with _$Image {
  const factory Image({
   required int id,
  required String pageURL,
  required List<String> tags,

    required
  }) = _Image;

  factory Image.fromJson(Map<String, Object?> json) => _$ImageFromJson(json);
}
