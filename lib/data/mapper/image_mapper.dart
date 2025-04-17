import 'package:image_finder/data/dto/image_dto.dart';
import 'package:image_finder/data/model/image.dart';

extension ImageMapper on ImageDto {
  Image toImage() {
    return Image(
      id: id?.toInt() ?? 0,
      pageURL: pageURL ?? 'No URL',
      tags: tags ?? [],
    );
  }
}
