import 'package:image_finder/data/dto/image_dto.dart';

abstract interface class ImageDataSource {
  Future<List<ImageDto>> getImages();

  Future<ImageDto> getImagesById(int id);

  Future<List<ImageDto>> searchImages(String query);
}
