import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/data_source/data_source.dart';
import 'package:image_finder/data/mapper/image_mapper.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource;

  ImageRepositoryImpl({required ImageDataSource imageDataSource})
    : _imageDataSource = imageDataSource;


  @override
  Future<Image> getImagesById(int id) async {
      final imageDto = await _imageDataSource.getImagesById(id);
      final image = imageDto.toImage();
      return image;
  }

  @override
  Future<List<Image>> searchImages(String query) async {
      final imageDto = await _imageDataSource.searchImages(query);
      final image = imageDto.map((e) => e.toImage()).toList();
      return image;

  }
}
