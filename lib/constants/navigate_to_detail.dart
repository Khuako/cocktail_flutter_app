import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/routes/routes.dart';
import 'package:flutter/cupertino.dart';

void navigateToDetail(
    {required String cocktailId,
    required String imageUrl,
    required String title,
    required BuildContext context}) {
  AutoRouter.of(context).push(CocktailDetailRoute(
      cocktailId: cocktailId, imageUrl: imageUrl, title: title));
}
