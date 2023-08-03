// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CocktailDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CocktailDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CocktailDetailScreen(
          key: args.key,
          cocktailId: args.cocktailId,
          imageUrl: args.imageUrl,
          title: args.title,
        ),
      );
    },
    IngDetailRoute.name: (routeData) {
      final args = routeData.argsAs<IngDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IngDetailScreen(
          key: args.key,
          ingTitle: args.ingTitle,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
  };
}

/// generated route for
/// [CocktailDetailScreen]
class CocktailDetailRoute extends PageRouteInfo<CocktailDetailRouteArgs> {
  CocktailDetailRoute({
    Key? key,
    required String cocktailId,
    required String imageUrl,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          CocktailDetailRoute.name,
          args: CocktailDetailRouteArgs(
            key: key,
            cocktailId: cocktailId,
            imageUrl: imageUrl,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CocktailDetailRoute';

  static const PageInfo<CocktailDetailRouteArgs> page =
      PageInfo<CocktailDetailRouteArgs>(name);
}

class CocktailDetailRouteArgs {
  const CocktailDetailRouteArgs({
    this.key,
    required this.cocktailId,
    required this.imageUrl,
    required this.title,
  });

  final Key? key;

  final String cocktailId;

  final String imageUrl;

  final String title;

  @override
  String toString() {
    return 'CocktailDetailRouteArgs{key: $key, cocktailId: $cocktailId, imageUrl: $imageUrl, title: $title}';
  }
}

/// generated route for
/// [IngDetailScreen]
class IngDetailRoute extends PageRouteInfo<IngDetailRouteArgs> {
  IngDetailRoute({
    Key? key,
    required String ingTitle,
    List<PageRouteInfo>? children,
  }) : super(
          IngDetailRoute.name,
          args: IngDetailRouteArgs(
            key: key,
            ingTitle: ingTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'IngDetailRoute';

  static const PageInfo<IngDetailRouteArgs> page =
      PageInfo<IngDetailRouteArgs>(name);
}

class IngDetailRouteArgs {
  const IngDetailRouteArgs({
    this.key,
    required this.ingTitle,
  });

  final Key? key;

  final String ingTitle;

  @override
  String toString() {
    return 'IngDetailRouteArgs{key: $key, ingTitle: $ingTitle}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children, required Null Function(dynamic success) onResult})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
