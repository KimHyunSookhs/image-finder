import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/data_source/image_data_source.dart';
import 'package:image_finder/data/mapper/image_mapper.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource;

  ImageRepositoryImpl({required ImageDataSource imageDataSource})
    : _imageDataSource = imageDataSource;

  @override
  Future<Result<List<Image>, String>> getImages() async {
    try {
      final imagesList = await _imageDataSource.getImages();
      final image = imagesList.map((e) => e.toImage()).toList();
      return Result.success(image);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<Image, String>> getImagesById(int id) async {
    try {
      final imageDto = await _imageDataSource.getImagesById(id);
      final image = imageDto.toImage();
      return Result.success(image);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
