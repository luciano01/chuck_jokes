import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/core.dart';
import '../../domain/domain.dart';

abstract class JokeCategoriesRemoteDataSource {
  /// Return a list of categories if the request from API.
  Future<List<CategoryEntity>> getCategories();
}

class JokeCategoriesRemoteDataSourceImpl
    implements JokeCategoriesRemoteDataSource {
  final http.Client client;

  JokeCategoriesRemoteDataSourceImpl(this.client);

  @override
  Future<List<CategoryEntity>> getCategories() async {
    /// GET request with the given headers and URL.
    final response = await client.get(
      Uri.parse('https://api.chucknorris.io/jokes/categories'),
      headers: {'Content-Type': 'application/json'},
    );

    /// Check if response code is 200 and
    /// format the json to List of Categories.
    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body)
          .map((category) => category.toString())
          .toList();

      List<CategoryEntity> listOfJokeCategories = [];

      jsonList.forEach((e) {
        final jokeCtegory = CategoryEntity(category: e);
        listOfJokeCategories.add(jokeCtegory);
      });

      return listOfJokeCategories;
    } else {
      /// Throw and Exception if response code is 400.
      throw ServerException();
    }
  }
}
