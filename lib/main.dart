import 'package:cocktail_project/cubit/alco_list_cubit.dart';
import 'package:cocktail_project/cubit/auth_cubit.dart';
import 'package:cocktail_project/cubit/cocktail_detail_cubit.dart';
import 'package:cocktail_project/cubit/favorite_cubit.dart';
import 'package:cocktail_project/cubit/favorite_list_cubit.dart';
import 'package:cocktail_project/cubit/non_alco_list_cubit.dart';
import 'package:cocktail_project/cubit/popular_drinks_cubit.dart';
import 'package:cocktail_project/cubit/random_cocktail_cubit.dart';
import 'package:cocktail_project/data/repositories/auth_repository.dart';
import 'package:cocktail_project/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (context) => AuthCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = AppRouter();
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteListCubit()..fetchFavoriteList(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => AlcoListCubit()..fetchAlcoDrinks(),
        ),
        BlocProvider(
          create: (context) => NonAlcoListCubit()..fetchNonAlcoDrinks(),
        ),
        BlocProvider(
          create: (context) => RandomCocktailCubit()..fetchRandomCocktail(),
        ),
        BlocProvider(
          create: (context) => PopularDrinksCubit()..fetchPopularDrinks(),
        ),
        BlocProvider(
          create: (context) => CocktailDetailCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.from(
          colorScheme:
              ColorScheme.fromSwatch(backgroundColor: Colors.grey.shade900),
        ),
        routerConfig: router.config(),
      ),
    );
  }
}
