// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/constants/constant_colors.dart';
import 'package:cocktail_project/constants/constant_text.dart';
import 'package:cocktail_project/cubit/cocktail_detail_cubit.dart';
import 'package:cocktail_project/cubit/favorite_cubit.dart';
import 'package:cocktail_project/cubit/favorite_list_cubit.dart';
import 'package:cocktail_project/model/cocktail_model.dart';
import 'package:cocktail_project/routes/routes.dart';
import 'package:cocktail_project/widgets/snack_bar.dart';
import 'package:cocktail_project/widgets/tag_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CocktailDetailScreen extends StatefulWidget {
  final String cocktailId;
  final String imageUrl;
  final String title;
  const CocktailDetailScreen(
      {super.key,
      required this.cocktailId,
      required this.imageUrl,
      required this.title});

  @override
  State<CocktailDetailScreen> createState() => _CocktailDetailScreenState();
}

class _CocktailDetailScreenState extends State<CocktailDetailScreen> {
  Future<bool>? isFavored;
  @override
  void initState() {
    context.read<CocktailDetailCubit>().fetchCocktailById(widget.cocktailId);
    context
        .read<FavoriteCubit>()
        .checkIfFavored(widget.imageUrl, widget.title, widget.cocktailId);
    super.initState();
  }

  String urlIng = 'https://www.thecocktaildb.com/images/ingredients/';
  void addIngridients(List<String> ing, DrinkInfo drink) {
    if (drink.strIngredient1 != null) {
      ing.add(drink.strIngredient1!);
    }
    if (drink.strIngredient2 != null) {
      ing.add(drink.strIngredient2!);
    }
    if (drink.strIngredient3 != null) {
      ing.add(drink.strIngredient3!);
    }
    if (drink.strIngredient4 != null) {
      ing.add(drink.strIngredient4!);
    }
    if (drink.strIngredient5 != null) {
      ing.add(drink.strIngredient5!);
    }
    if (drink.strIngredient6 != null) {
      ing.add(drink.strIngredient6!);
    }
    if (drink.strIngredient7 != null) {
      ing.add(drink.strIngredient7!);
    }
    if (drink.strIngredient8 != null) {
      ing.add(drink.strIngredient8!);
    }
    if (drink.strIngredient9 != null) {
      ing.add(drink.strIngredient9!);
    }
    if (drink.strIngredient10 != null) {
      ing.add(drink.strIngredient10!);
    }
    if (drink.strIngredient11 != null) {
      ing.add(drink.strIngredient11!);
    }
    if (drink.strIngredient12 != null) {
      ing.add(drink.strIngredient12!);
    }
    if (drink.strIngredient13 != null) {
      ing.add(drink.strIngredient13!);
    }
    if (drink.strIngredient14 != null) {
      ing.add(drink.strIngredient14!);
    }
    if (drink.strIngredient15 != null) {
      ing.add(drink.strIngredient15!);
    }
  }

  void addMeasure(List<String> mes, DrinkInfo drink) {
    if (drink.strMeasure1 != null) {
      mes.add(drink.strMeasure1!);
    }
    if (drink.strMeasure2 != null) {
      mes.add(drink.strMeasure2!);
    }
    if (drink.strMeasure3 != null) {
      mes.add(drink.strMeasure3!);
    }
    if (drink.strMeasure4 != null) {
      mes.add(drink.strMeasure4!);
    }
    if (drink.strMeasure5 != null) {
      mes.add(drink.strMeasure5!);
    }
    if (drink.strMeasure6 != null) {
      mes.add(drink.strMeasure6!);
    }
    if (drink.strMeasure7 != null) {
      mes.add(drink.strMeasure7!);
    }
    if (drink.strMeasure8 != null) {
      mes.add(drink.strMeasure8!);
    }
    if (drink.strMeasure9 != null) {
      mes.add(drink.strMeasure9!);
    }
    if (drink.strMeasure10 != null) {
      mes.add(drink.strMeasure10!);
    }
    if (drink.strMeasure11 != null) {
      mes.add(drink.strMeasure11!);
    }
    if (drink.strMeasure12 != null) {
      mes.add(drink.strMeasure12!);
    }
    if (drink.strMeasure13 != null) {
      mes.add(drink.strMeasure13!);
    }
    if (drink.strMeasure14 != null) {
      mes.add(drink.strMeasure14!);
    }
    if (drink.strMeasure15 != null) {
      mes.add(drink.strMeasure15!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailDetailCubit, CocktailDetailState>(
      builder: (context, state) {
        if (state is CocktailDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ConstantColors.purpleColor,
            ),
          );
        }
        if (state is CocktailDetailLoaded) {
          final cocktailDetail = state.drinkInfo;
          List<String> ing = [];
          List<String> tags = cocktailDetail.strTags?.split(',').toList() ?? [];
          List<String> mes = [];
          addIngridients(ing, cocktailDetail);
          addMeasure(mes, cocktailDetail);
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(state.drinkInfo.strDrinkThumb!),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                          ),
                          child: Center(
                            child: Text(
                              cocktailDetail.strDrink!,
                              style: ConstantText.bigWhiteText,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 15,
                        child: IconButton(
                          iconSize: 30,
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            AutoRouter.of(context).pop();
                          },
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 15,
                        child: BlocBuilder<FavoriteCubit, FavoriteState>(
                          builder: (context, state) {
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              child: state is FavoriteRed
                                  ? Container(
                                      key: UniqueKey(),
                                      child: IconButton(
                                        onPressed: () async {
                                          showSnackBar(context, Colors.black,
                                              'Cocktail was removed from favorite');
                                          await context
                                              .read<FavoriteCubit>()
                                              .addOrRemove(
                                                  widget.imageUrl,
                                                  widget.title,
                                                  widget.cocktailId);

                                          await context
                                              .read<FavoriteListCubit>()
                                              .fetchFavoriteList();
                                        },
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      key: UniqueKey(),
                                      child: IconButton(
                                        iconSize: 30,
                                        icon: const Icon(
                                          Icons.favorite_outline_rounded,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          showSnackBar(context, Colors.black,
                                              'Cocktail was added to favorite');
                                          await context
                                              .read<FavoriteCubit>()
                                              .addOrRemove(
                                                  widget.imageUrl,
                                                  widget.title,
                                                  widget.cocktailId);

                                          await context
                                              .read<FavoriteListCubit>()
                                              .fetchFavoriteList();
                                        },
                                      ),
                                    ),
                            );
                            // if (state is FavoriteRed) {

                            // return IconButton(
                            //   iconSize: 30,
                            //   icon: const Icon(
                            //     Icons.favorite,
                            //     color: Colors.red,
                            //   ),
                            // onPressed: () async {
                            //   showSnackBar(context, Colors.black,
                            //       'Cocktail was removed from favorite');
                            //   await context
                            //       .read<FavoriteCubit>()
                            //       .addOrRemove(widget.imageUrl,
                            //           widget.title, widget.cocktailId);

                            //   await context
                            //       .read<FavoriteListCubit>()
                            //       .fetchFavoriteList();
                            // },
                            //   );
                            // }

                            // return IconButton(
                            //   iconSize: 30,
                            //   icon: const Icon(
                            //     Icons.favorite_outline_rounded,
                            //     color: Colors.white,
                            //   ),
                            //   onPressed: () async {
                            //     showSnackBar(context, Colors.black,
                            //         'Cocktail was added to favorite');
                            //     await context.read<FavoriteCubit>().addOrRemove(
                            //         widget.imageUrl,
                            //         widget.title,
                            //         widget.cocktailId);

                            //     await context
                            //         .read<FavoriteListCubit>()
                            //         .fetchFavoriteList();
                            //   },
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Tags',
                    style: ConstantText.titleTextStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                          child: tags.isEmpty
                              ? Text(
                                  'No tags',
                                  style: ConstantText.tagText,
                                )
                              : ListView.builder(
                                  itemCount: tags.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return TagCardWidget(title: tags[index]);
                                  },
                                ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Ingredients',
                          style: ConstantText.titleTextStyle,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 3,
                                    mainAxisExtent: 230),
                            itemCount: ing.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  AutoRouter.of(context).push(
                                      IngDetailRoute(ingTitle: ing[index]));
                                },
                                child: SizedBox(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '$urlIng${ing[index]}-Medium.png'),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: index > mes.length - 1
                                            ? Text(
                                                ing[index],
                                                style: ConstantText.ingText,
                                                textAlign: TextAlign.center,
                                              )
                                            : Text(
                                                '${mes[index]} ${ing[index]}',
                                                style: ConstantText.ingText,
                                                textAlign: TextAlign.center,
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.withOpacity(0.15)),
                          child: Column(
                            children: [
                              Text(
                                cocktailDetail.strInstructions!,
                                style: ConstantText.titleTextStyle,
                                textAlign: TextAlign.center,
                              ),
                              cocktailDetail.strGlass == null
                                  ? Container()
                                  : Text(
                                      '\nServe : ${cocktailDetail.strGlass!}',
                                      style: ConstantText.titleTextStyle,
                                      textAlign: TextAlign.center,
                                    )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
