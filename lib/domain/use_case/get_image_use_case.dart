import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/repository/image_repository.dart';

class GetImageUseCase {
  final ImageRepository _imageRepository;

  GetImageUseCase({required ImageRepository imageRepository})
    : _imageRepository = imageRepository;

  Future<Result<List<Image>, String>> execute() async {
    return await _imageRepository.getImages();
  }
}
