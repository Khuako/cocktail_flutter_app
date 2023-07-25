import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/constants/constant_colors.dart';
import 'package:cocktail_project/constants/constant_text.dart';
import 'package:cocktail_project/cubit/alco_list_cubit.dart';
import 'package:cocktail_project/cubit/non_alco_list_cubit.dart';
import 'package:cocktail_project/cubit/popular_drinks_cubit.dart';
import 'package:cocktail_project/cubit/random_cocktail_cubit.dart';
import 'package:cocktail_project/widgets/list_widget.dart';
import 'package:cocktail_project/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        physics: AlwaysScrollableScrollPhysics(),
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
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          _alcIndex = index;
                          setState(() {});
                        },
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Ms',
                            fontWeight: FontWeight.bold,
                            color: _alcIndex == index
                                ? ConstantColors.blueColor
                                : Colors.white,
                            decoration: _alcIndex == index
                                ? TextDecoration.underline
                                : null,
                            decorationColor: ConstantColors.blueColor,
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
              Container(
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
                                  return ListWidget(
                                      cockName:
                                          state.alcoDrinks[index].strDrink!,
                                      cockImage: state
                                          .alcoDrinks[index].strDrinkThumb!);
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
                                  return ListWidget(
                                      cockName:
                                          state.alcoDrinks[index].strDrink!,
                                      cockImage: state
                                          .alcoDrinks[index].strDrinkThumb!);
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
                    return Column(
                      children: [
                        Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      state.drinkInfo.strDrinkThumb!))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.drinkInfo.strDrink!,
                          style: ConstantText.smallGradientText,
                        )
                      ],
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
                height: 850,
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                  child: BlocBuilder<PopularDrinksCubit, PopularDrinksState>(
                    builder: (context, state) {
                      if (state is PopularDrinksLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                              color: ConstantColors.blueColor),
                        );
                      }
                      if (state is PopularDrinksLoaded) {
                        return GridView.builder(
                          shrinkWrap: true,
                          itemCount: 8,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 170,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
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
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
