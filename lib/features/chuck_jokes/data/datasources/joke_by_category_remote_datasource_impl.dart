import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/core.dart';
import '../data.dart';

abstract class JokeByCategoryRemoteDataSource {
  /// Return a Joke by Category from API.
  Future<JokeModel> getJokeByCategory({required String category});
}

class JokeByCategoryRemoteDataSourceImpl
    implements JokeByCategoryRemoteDataSource {
  final http.Client _client;

  JokeByCategoryRemoteDataSourceImpl(this._client);

  @override
  Future<JokeModel> getJokeByCategory({
    required String category,
  }) async {
    final response = await _client.get(
      Uri.parse('https://api.chucknorris.io/jokes/random?category=$category'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return JokeModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
