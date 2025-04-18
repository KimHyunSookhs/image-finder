
import 'package:image_finder/data/model/image.dart';

abstract interface class ImageRepository {
  Future<Image> getImagesById(int id);

  Future<List<Image>>  searchImages(String query);
}
