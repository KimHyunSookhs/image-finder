import 'package:get_it/get_it.dart';
import 'package:image_finder/data/data_source/data_source.dart';
import 'package:image_finder/data/repository/image_repository_impl.dart';
import 'package:image_finder/domain/repository/image_repository.dart';
import 'package:image_finder/domain/use_case/get_image_by_id_use_case.dart';
import 'package:image_finder/domain/use_case/get_image_use_case.dart';
import 'package:image_finder/domain/use_case/search_images_use_case.dart';
import 'package:image_finder/presentation/detail_screen/detail_screen_view_model.dart';
import 'package:image_finder/presentation/search_screen/search_screen_view_model.dart';

final getIt = GetIt.instance;

void diSetUP() {
  getIt.registerSingleton<ImageDataSource>(ImageDataSourceImpl());
  getIt.registerSingleton<ImageRepository>(
    ImageRepositoryImpl(imageDataSource: getIt()),
  );
  getIt.registerSingleton(SearchImagesUseCase(imageRepository:getIt()));
  getIt.registerSingleton(GetImageByIdUseCase(imageRepository: getIt()));
  getIt.registerSingleton(GetImageUseCase(imageRepository: getIt()));
  //ViewModel GetIt
  getIt.registerFactory<SearchScreenViewModel>(
        () => SearchScreenViewModel(
      getImageUseCase: getIt(),
      searchImagesUseCase: getIt(),
    ),
  );
  getIt.registerFactory<DetailScreenViewModel>(
        () => DetailScreenViewModel(getImageByIdUseCase: getIt()),
  );
}
