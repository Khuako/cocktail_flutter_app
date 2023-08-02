import 'dart:convert';
import 'package:cocktail_project/model/alcoholic_model.dart';
import 'package:http/http.dart';

import '../../jsons/popular_drinks_json.dart';
import '../../model/cocktail_model.dart';

class CocktailApiProvider {
  Client client = Client();
  final String baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';
  final String alcoUrl = 'filter.php?a=Alcoholic';
  final String nonAlcoUrl = 'filter.php?a=Non_Alcoholic';
  final String randomCocktail = 'random.php';
  Future<List<Drinks>> fetchDrinks(bool isAlco) async {
    final response = isAlco
        ? await client.get(Uri.parse(baseUrl + alcoUrl))
        : await client.get(Uri.parse(baseUrl + nonAlcoUrl));
    return AlcoholicModel.fromJson(json.decode(response.body)).drinks!;
  }

  Future<DrinkInfo> fetchRandomCocktail() async {
    final response = await client.get(Uri.parse(baseUrl + randomCocktail));
    if (response.statusCode == 200) {
      return Cocktail.fromJson(json.decode(response.body)).drinks![0];
    } else {
      return Future.error('Error response');
    }
  }

  Future<List<Drinks>> fetchPopularDrinks() async {
    return AlcoholicModel.fromJson(json.decode(jsonPopularDrinks)).drinks!;
  }

  Future<DrinkInfo> fetchCocktailById(String cocktailId) async {
    final response =
        await client.get(Uri.parse('${baseUrl}lookup.php?i=$cocktailId'));
    if (response.statusCode == 200) {
      return Cocktail.fromJson(json.decode(response.body)).drinks![0];
    } else {
      return Future.error('Error response');
    }
  }

  Future<Cocktail> fetchSearchList(String query) async {
    final response =
        await client.get(Uri.parse('${baseUrl}search.php?s=$query'));
    if (response.statusCode == 200) {
      return Cocktail.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
