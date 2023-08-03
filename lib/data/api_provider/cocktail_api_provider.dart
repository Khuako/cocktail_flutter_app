import 'dart:convert';
import 'dart:io';
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
    if (response.statusCode == 200) {
      return AlcoholicModel.fromJson(json.decode(response.body)).drinks!;
    } else {
      throw Exception('Error response');
    }
  }

  Future<AlcoholicModel> fetchIngridientDrinks(String query) async {
    final response =
        await client.get(Uri.parse('${baseUrl}filter.php?i=$query'));
    if (response.statusCode == 200) {
      return AlcoholicModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }

  Future<DrinkInfo> fetchRandomCocktail() async {
    final response = await client.get(Uri.parse(baseUrl + randomCocktail));
    if (response.statusCode == 200) {
      return Cocktail.fromJson(json.decode(response.body)).drinks![0];
    } else {
      throw Exception('Error response');
    }
  }

  Future fetchPopularDrinks() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return AlcoholicModel.fromJson(json.decode(jsonPopularDrinks)).drinks!;
      }
    } on SocketException catch (_) {
      throw Exception('Error response');
    }
  }

  Future<DrinkInfo> fetchCocktailById(String cocktailId) async {
    final response =
        await client.get(Uri.parse('${baseUrl}lookup.php?i=$cocktailId'));
    if (response.statusCode == 200) {
      return Cocktail.fromJson(json.decode(response.body)).drinks![0];
    } else {
      throw Exception('Error response');
    }
  }

  Future<Cocktail> fetchSearchList(String query) async {
    final response =
        await client.get(Uri.parse('${baseUrl}search.php?s=$query'));
    if (response.statusCode == 200) {
      return Cocktail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
