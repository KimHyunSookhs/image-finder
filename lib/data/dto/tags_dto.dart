import 'package:json_annotation/json_annotation.dart';

part 'tags_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TagsDto {
  final String? tags;

  const TagsDto(this.tags);

  List<String> get parsedTags =>
      tags?.split(',').map((e) => e.trim()).toList() ?? [];

  factory TagsDto.fromJson(Map<String, dynamic> json) =>
      _$TagsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TagsDtoToJson(this);
}
