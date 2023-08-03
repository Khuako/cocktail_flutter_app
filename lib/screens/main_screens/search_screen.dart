import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/constants/navigate_to_detail.dart';
import 'package:cocktail_project/cubit/search_cubit.dart';
import 'package:cocktail_project/widgets/image_and_tite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constant_text.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          height: 50,
          child: TextField(
            onSubmitted: (value) {
              context.read<SearchCubit>().fetchSearch(value);
            },
            onChanged: (value) {
              context.read<SearchCubit>().fetchSearch(value);
            },
            style: ConstantText.titleTextStyle,
            controller: searchController,
            cursorColor: Colors.grey.shade800,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              hintText: "eg: Margarita",
              hintStyle: ConstantText.hintStyle,
              prefixIconColor: Colors.yellow,
              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {
                  context
                      .read<SearchCubit>()
                      .fetchSearch(searchController.text);
                },
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusColor: Colors.white,
              hoverColor: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                if (state is SearchFoundNone) {
                  return Center(
                    child: Text(
                      'No cocktails were found',
                      style: ConstantText.tagText,
                    ),
                  );
                }
                if (state is SearchFound) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.searchList.length,
                    itemExtent: 270,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          navigateToDetail(
                              cocktailId: state.searchList[index].idDrink!,
                              imageUrl: state.searchList[index].strDrinkThumb!,
                              title: state.searchList[index].strDrink!,
                              context: context);
                        },
                        child: ImageAndTitleWidget(
                          imageUrl: state.searchList[index].strDrinkThumb!,
                          title: state.searchList[index].strDrink!,
                          style: ConstantText.searchText,
                        ),
                      );
                    },
                  );
                }
                if (state is SearchFailure) {
                  return Center(
                    child: Text(
                      'No connection to the Internet',
                      style: ConstantText.titleTextStyle,
                    ),
                  );
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
