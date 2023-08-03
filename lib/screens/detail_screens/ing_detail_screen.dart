import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/constants/constant_text.dart';
import 'package:cocktail_project/constants/navigate_to_detail.dart';
import 'package:cocktail_project/cubit/ing_cubit.dart';
import 'package:cocktail_project/model/alcoholic_model.dart';
import 'package:cocktail_project/widgets/image_and_tite_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class IngDetailScreen extends StatefulWidget {
  final String ingTitle;

  const IngDetailScreen({super.key, required this.ingTitle});

  @override
  State<IngDetailScreen> createState() => _IngDetailScreenState();
}

class _IngDetailScreenState extends State<IngDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<IngCubit>().fetchIngDrinks(widget.ingTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
        ),
        title: Text(
          widget.ingTitle,
          style: ConstantText.titleTextStyle,
        ),
      ),
      body: BlocBuilder<IngCubit, IngState>(
        builder: (context, state) {
          if (state is IngLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.grey),
            );
          }
          if (state is IngLoaded) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Column(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageAndTitleWidget(
                          imageUrl:
                              'https://www.thecocktaildb.com/images/ingredients/${widget.ingTitle}.png',
                          title: 'All drinks related to ${widget.ingTitle}',
                          style: ConstantText.ingText),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 260,
                              crossAxisSpacing: 20),
                      shrinkWrap: true,
                      itemCount: state.drinks.length,
                      itemBuilder: (context, index) {
                        final List<Drinks> drinks = state.drinks;
                        return GestureDetector(
                          onTap: () {
                            navigateToDetail(
                                cocktailId: drinks[index].idDrink!,
                                imageUrl: drinks[index].strDrinkThumb!,
                                title: drinks[index].strDrink!,
                                context: context);
                          },
                          child: ImageAndTitleWidget(
                              imageUrl: drinks[index].strDrinkThumb!,
                              title: drinks[index].strDrink!,
                              style: ConstantText.bigGradientText),
                        );
                      },
                    ),
                  ),
                ]),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
