import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/repository/image_repository.dart';

class GetImageUseCase {
  final ImageRepository _imageRepository;

  GetImageUseCase({required ImageRepository imageRepository})
      : _imageRepository = imageRepository;

  Future<Result<List<Image>, String>> execute(String query) async {
    try {
      final results = await _imageRepository.searchImages(query);
      if (results.isEmpty) {
        return Result.error(('"$query"\n검색결과가 없습니다.'));
      }
      return Result.success(results);
    } catch (e) {
      return Result.error((e.toString()));
    }
  }
}
