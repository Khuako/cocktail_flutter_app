import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/constants/constant_colors.dart';
import 'package:cocktail_project/constants/constant_text.dart';
import 'package:cocktail_project/cubit/alco_list_cubit.dart';
import 'package:cocktail_project/cubit/non_alco_list_cubit.dart';
import 'package:cocktail_project/cubit/popular_drinks_cubit.dart';
import 'package:cocktail_project/cubit/random_cocktail_cubit.dart';
import 'package:cocktail_project/routes/routes.dart';
import 'package:cocktail_project/widgets/image_and_tite_widget.dart';
import 'package:cocktail_project/widgets/list_widget.dart';
import 'package:cocktail_project/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/navigate_to_detail.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ['Alcoholic', 'Non-Alcoholic'];
  int _alcIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          _alcIndex = index;
                          setState(() {});
                        },
                        child: Text(
                          categories[index],
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: _alcIndex == index
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: _alcIndex == index
                                ? Colors.yellow
                                : Colors.white,
                            decoration: _alcIndex == index
                                ? TextDecoration.underline
                                : null,
                            decorationColor: Colors.yellow,
                            decorationThickness: 0.5,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  itemExtent: 190,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: _alcIndex == 0
                          ? BlocBuilder<AlcoListCubit, AlcoListState>(
                              builder: (context, state) {
                                if (state is AlcoListLoaded) {
                                  return GestureDetector(
                                    onTap: () {
                                      navigateToDetail(
                                          cocktailId:
                                              state.alcoDrinks[index].idDrink!,
                                          imageUrl: state
                                              .alcoDrinks[index].strDrinkThumb!,
                                          title:
                                              state.alcoDrinks[index].strDrink!,
                                          context: context);
                                    },
                                    child: ListWidget(
                                        cockName:
                                            state.alcoDrinks[index].strDrink!,
                                        cockImage: state
                                            .alcoDrinks[index].strDrinkThumb!),
                                  );
                                } else if (state is AlcoListFailure) {
                                  showSnackBar(
                                      context, Colors.red, state.e.toString());
                                }
                                return Container();
                              },
                            )
                          : BlocBuilder<NonAlcoListCubit, NonAlcoListState>(
                              builder: (context, state) {
                                if (state is NonAlcoListInitial) {
                                  return Container();
                                }
                                if (state is NonAlcoListLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: ConstantColors.blueColor,
                                    ),
                                  );
                                }
                                if (state is NonAlcoListLoaded) {
                                  return GestureDetector(
                                    onTap: () {
                                      navigateToDetail(
                                          cocktailId:
                                              state.alcoDrinks[index].idDrink!,
                                          imageUrl: state
                                              .alcoDrinks[index].strDrinkThumb!,
                                          title:
                                              state.alcoDrinks[index].strDrink!,
                                          context: context);
                                    },
                                    child: ListWidget(
                                        cockName:
                                            state.alcoDrinks[index].strDrink!,
                                        cockImage: state
                                            .alcoDrinks[index].strDrinkThumb!),
                                  );
                                }
                                if (state is NonAlcoListFailure) {
                                  showSnackBar(
                                      context, Colors.red, state.e.toString());
                                }
                                return Container();
                              },
                            ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'RANDOM COCKTAIL FOR YOU',
                style: ConstantText.bigGradientText,
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<RandomCocktailCubit, RandomCocktailState>(
                builder: (context, state) {
                  if (state is RandomCocktailLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ConstantColors.blueColor,
                      ),
                    );
                  }
                  if (state is RandomCocktailLoaded) {
                    return GestureDetector(
                      onTap: () {
                        navigateToDetail(
                            cocktailId: state.drinkInfo.idDrink!,
                            imageUrl: state.drinkInfo.strDrinkThumb!,
                            title: state.drinkInfo.strDrink!,
                            context: context);
                      },
                      child: ImageAndTitleWidget(
                        imageUrl: state.drinkInfo.strDrinkThumb!,
                        title: state.drinkInfo.strDrink!,
                        style: ConstantText.smallGradientText,
                      ),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Popular Drinks',
                style: ConstantText.bigWhiteText,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: BlocBuilder<PopularDrinksCubit, PopularDrinksState>(
                  builder: (context, state) {
                    if (state is PopularDrinksLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: ConstantColors.blueColor),
                      );
                    }
                    if (state is PopularDrinksLoaded) {
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                mainAxisExtent: 200,
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              navigateToDetail(
                                  cocktailId:
                                      state.popularDrinks[index].idDrink!,
                                  imageUrl:
                                      state.popularDrinks[index].strDrinkThumb!,
                                  title: state.popularDrinks[index].strDrink!,
                                  context: context);
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 170,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(state
                                            .popularDrinks[index]
                                            .strDrinkThumb!),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  state.popularDrinks[index].strDrink!,
                                  style: ConstantText.smallRandomGradientText,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
