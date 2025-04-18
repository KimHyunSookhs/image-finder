import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_finder/core/routing/routes.dart';
import 'package:image_finder/data/data_source/image_data_source_impl.dart';
import 'package:image_finder/data/repository/image_repository_impl.dart';
import 'package:image_finder/domain/use_case/get_image_by_id_use_case.dart';
import 'package:image_finder/domain/use_case/get_image_use_case.dart';
import 'package:image_finder/domain/use_case/search_images_use_case.dart';
import 'package:image_finder/presentation/detail_screen/detail_screen.dart';
import 'package:image_finder/presentation/detail_screen/detail_screen_view_model.dart';
import 'package:image_finder/presentation/search_screen/search_screen.dart';
import 'package:image_finder/presentation/search_screen/search_screen_view_model.dart';

import '../di/di_setup.dart';

final router = GoRouter(
  initialLocation: Routes.searchScreen,
  routes: [
    GoRoute(
      path: Routes.searchScreen,
      builder: (context, state) {
        final viewModel = SearchScreenViewModel( searchImagesUseCase: getIt());
        return SearchScreen(screenViewModel: viewModel);
      },
    ),
    GoRoute(
      path: Routes.detailScreen,
      builder: (context, state) {
        final idString = state.pathParameters['id'];

        // id가 없거나 잘못된 형식일 경우 예외 처리
        if (idString == null) {
          return const Scaffold(body: Center(child: Text('ID가 제공되지 않았습니다.')));
        }

        // id가 숫자로 변환될 수 있는지 확인
        final id = int.tryParse(idString);
        if (id == null) {
          return const Scaffold(body: Center(child: Text('ID 형식이 잘못되었습니다.')));
        }

        final viewModel = DetailScreenViewModel(getImageByIdUseCase: getIt());
        return DetailScreen(detailScreenViewModel: viewModel, id: id);
      },
    )

  ],
);
