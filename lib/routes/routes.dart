import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/cubit/auth_cubit.dart';
import 'package:cocktail_project/routes/auth_guard.dart';
import 'package:cocktail_project/screens/main_screens/auth/register_screen.dart';

import '../screens/detail_screens/cocktail_detail_screen.dart';
import '../screens/main_screens/auth/login_screen.dart';
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
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page,),
        AutoRoute(page: MainRoute.page, initial: true,guards: [AuthGuard()]),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: FavoriteRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: CocktailDetailRoute.page),
      ];
}
