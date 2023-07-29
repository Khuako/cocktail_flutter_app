import 'package:auto_route/auto_route.dart';

import '../screens/detail_screens/cocktail_detail_screen.dart';
import '../screens/main_screens/favorite_screen.dart';
import '../screens/main_screens/home_screen.dart';
import '../screens/main_screens/main_screen.dart';
import '../screens/main_screens/profile_screen.dart';
import '../screens/main_screens/search_screen.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, path: '/'),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: FavoriteRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: CocktailDetailRoute.page),
      ];
}
