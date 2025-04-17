import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/repository/image_repository.dart';

class GetImageByIdUseCase {
  final ImageRepository _imageRepository;

  GetImageByIdUseCase({required ImageRepository imageRepository})
    : _imageRepository = imageRepository;

  Future<Result<Image, String>> execute(int id) async {
    print('이미지 ${id}');
    return await _imageRepository.getImagesById(id);
  }
}
