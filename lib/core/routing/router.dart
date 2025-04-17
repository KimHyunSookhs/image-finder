import 'package:go_router/go_router.dart';
import 'package:image_finder/core/routing/routes.dart';
import 'package:image_finder/data/data_source/image_data_source_impl.dart';
import 'package:image_finder/data/repository/image_repository_impl.dart';
import 'package:image_finder/domain/use_case/get_image_use_case.dart';
import 'package:image_finder/presentation/search_screen/search_screen.dart';
import 'package:image_finder/presentation/search_screen/search_screen_view_model.dart';

final router = GoRouter(
  initialLocation: Routes.searchScreen,
  routes: [
    GoRoute(
      path: Routes.searchScreen,
      builder: (context, state) {
        final viewModel = SearchScreenViewModel(
          getImageUseCase: GetImageUseCase(
            imageRepository: ImageRepositoryImpl(
              imageDataSource: ImageDataSourceImpl(),
            ),
          ),
        );
        return SearchScreen(screenViewModel: viewModel);
      },
    ),
  ],
);
