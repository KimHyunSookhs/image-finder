import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/repository/image_repository.dart';

class GetImageByIdUseCase {
  final ImageRepository _imageRepository;

  GetImageByIdUseCase({required ImageRepository imageRepository})
    : _imageRepository = imageRepository;

  Future<Result<List<Image>, String>> execute(int id) async {
    final result =  await _imageRepository.getImagesById(id);
    return Result.success([result]);
  }
}
