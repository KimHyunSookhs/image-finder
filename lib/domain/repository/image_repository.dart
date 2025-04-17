import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/model/image.dart';

abstract interface class ImageRepository {
  Future<Result<List<Image>, String>> getImages(String prompt);
}
