import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'package:chuck_jokes/core/core.dart';
import 'package:chuck_jokes/features/chuck_jokes/data/datasources/joke_categories_remote_data_source.dart';
import 'package:chuck_jokes/features/chuck_jokes/domain/domain.dart';

import '../../../../utils/json_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late JokeCategoriesRemoteDataSourceImpl jokeCategoriesRemoteDataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    jokeCategoriesRemoteDataSourceImpl = JokeCategoriesRemoteDataSourceImpl(
      mockHttpClient,
    );
  });

  test('Should execute a GET request with the given headers and URL.',
      () async {
    when(() => mockHttpClient.get(
              Uri.parse('https://api.chucknorris.io/jokes/categories'),
              headers: any(named: 'headers'),
            ))
        .thenAnswer((_) async =>
            http.Response(fixture('joke_categories_response.json'), 200));

    await jokeCategoriesRemoteDataSourceImpl.getCategories();

    verify(() => mockHttpClient.get(
          Uri.parse('https://api.chucknorris.io/jokes/categories'),
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    verifyNoMoreInteractions(mockHttpClient);
  });

  test("Should return a List of Categories if request is successful.",
      () async {
    when(() => mockHttpClient.get(
              Uri.parse('https://api.chucknorris.io/jokes/categories'),
              headers: any(named: 'headers'),
            ))
        .thenAnswer((_) async =>
            http.Response(fixture('joke_categories_response.json'), 200));

    final result = await jokeCategoriesRemoteDataSourceImpl.getCategories();

    List<CategoryEntity> listOfJokeCategories = [];

    List<String> mockListOfJokeCategories = [
      "animal",
      "career",
      "celebrity",
      "dev",
      "explicit",
      "fashion",
      "food",
      "history",
      "money",
      "movie",
      "music",
      "political",
      "religion",
      "science",
      "sport",
      "travel"
    ];

    for (var element in mockListOfJokeCategories) {
      listOfJokeCategories.add(CategoryEntity(category: element));
    }

    expect(result, isA<List<CategoryEntity>>());
    expect(result, listOfJokeCategories);
  });

  test("Should return an Exception if request fail.", () async {
    when(() => mockHttpClient.get(
          Uri.parse('https://api.chucknorris.io/jokes/categories'),
          headers: any(named: 'headers'),
        )).thenAnswer((_) async => http.Response("", 400));

    final result = jokeCategoriesRemoteDataSourceImpl.getCategories();

    expect(result, throwsA(const TypeMatcher<ServerException>()));
  });
}
