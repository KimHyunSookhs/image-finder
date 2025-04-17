import 'package:go_router/go_router.dart';
import 'package:image_finder/core/routing/routes.dart';
import 'package:image_finder/presentation/search_screen/search_screen.dart';

final router = GoRouter(
  initialLocation: Routes.searchScreen,
  routes: [
    GoRoute(
      path: Routes.searchScreen,
      builder: (context, state) => const SearchScreen(),
    ),
  ],
);
