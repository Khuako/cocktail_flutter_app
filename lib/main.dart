import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/constants/constant_colors.dart';
import 'package:cocktail_project/cubit/alco_list_cubit.dart';
import 'package:cocktail_project/cubit/non_alco_list_cubit.dart';
import 'package:cocktail_project/cubit/popular_drinks_cubit.dart';
import 'package:cocktail_project/cubit/random_cocktail_cubit.dart';
import 'package:cocktail_project/model/cocktail_model.dart';
import 'package:cocktail_project/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(
              backgroundColor: Colors.black.withOpacity(0.2)),
        ),
        routerConfig: router.config(),
      ),
    );
  }
}
