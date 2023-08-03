import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/constants/constant_text.dart';
import 'package:cocktail_project/cubit/favorite_list_cubit.dart';
import 'package:cocktail_project/widgets/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/navigate_to_detail.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Favorite Drinks',
            style: ConstantText.bigWhiteText,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: BlocBuilder<FavoriteListCubit, FavoriteListState>(
          builder: (context, state) {
            if (state is FavoriteListLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.grey),
              );
            }
            if (state is FavoriteListLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(25),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 180,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemCount: state.favDrinks!.length,
                        itemBuilder: (context, index) {
                          List<String> currentCocktail =
                              state.favDrinks![index].split('_');
                          return GestureDetector(
                            onTap: () {
                              navigateToDetail(
                                  cocktailId: currentCocktail[2],
                                  imageUrl: currentCocktail[0],
                                  title: currentCocktail[1],
                                  context: context);
                            },
                            child: ListWidget(
                                cockName: currentCocktail[1],
                                cockImage: currentCocktail[0]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            if(state is FavoriteListFailure){
              return Center(child: Text('No connection to the Internet', style: ConstantText.tagText,),);
            }
            return Container();
          },
        ));
  }
}
