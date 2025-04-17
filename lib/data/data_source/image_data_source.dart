import 'package:image_finder/data/dto/image_dto.dart';

abstract interface class ImageDataSource {
  Future<List<ImageDto>> getImages(String prompt);
}
