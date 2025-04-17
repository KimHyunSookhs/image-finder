import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  @override
  Future<Result<List<Image>, String>> getImages() {
    // TODO: implement getImages
    throw UnimplementedError();
  }
}
