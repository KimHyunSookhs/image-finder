import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/repository/image_repository.dart';

class SearchImagesUseCase {
  final ImageRepository _imageRepository;


  Future<Result<List<Image>, String>> execute(String query) async {
    return _imageRepository.searchImages(query);
  }

  const SearchImagesUseCase({
    required ImageRepository imageRepository,
  }) : _imageRepository = imageRepository;
}
