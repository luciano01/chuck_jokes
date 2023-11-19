import 'package:chuck_jokes/core/core.dart';
import 'package:chuck_jokes/features/chuck_jokes/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'package:chuck_jokes/features/chuck_jokes/data/data.dart';

import '../../../../utils/json_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late JokeByCategoryRemoteDataSourceImpl jokeByCategoryRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    jokeByCategoryRemoteDataSourceImpl = JokeByCategoryRemoteDataSourceImpl(
      mockHttpClient,
    );
  });

  const mockCategory = 'dev';

  test('Should execute a GET request with the given headers and URL.',
      () async {
    when(() => mockHttpClient.get(
        Uri.parse(
            'https://api.chucknorris.io/jokes/random?category=$mockCategory'),
        headers:
            any(named: "headers"))).thenAnswer(
        (_) async => http.Response(fixture('joke_response.json'), 200));

    await jokeByCategoryRemoteDataSourceImpl.getJokeByCategory(
        category: mockCategory);

    verify(() => mockHttpClient.get(
          Uri.parse(
              'https://api.chucknorris.io/jokes/random?category=$mockCategory'),
          headers: {
            'Content-Type': 'application/json',
          },
        ));
  });

  test("Should return a Joke by Category if request is successful.", () async {
    when(() => mockHttpClient.get(
              Uri.parse(
                  'https://api.chucknorris.io/jokes/random?category=$mockCategory'),
              headers: any(named: 'headers'),
            ))
        .thenAnswer(
            (_) async => http.Response(fixture('joke_response.json'), 200));

    final result = await jokeByCategoryRemoteDataSourceImpl.getJokeByCategory(
        category: mockCategory);

    const mockJokeModel = JokeModel(
      categories: [''],
      createdAt: '',
      iconUrl: '',
      id: '',
      updatedAt: '',
      url: '',
      value: '',
    );

    expect(result, isA<JokeEntity>());
    expect(result, mockJokeModel);
  });

  test(
    'Should throw a ServerException if request fail.',
    () {
      when(() => mockHttpClient.get(
            Uri.parse(
                'https://api.chucknorris.io/jokes/random?category=$mockCategory'),
            headers: any(named: 'headers'),
          )).thenAnswer((_) async => http.Response('', 404));

      final result = jokeByCategoryRemoteDataSourceImpl.getJokeByCategory(
          category: mockCategory);

      expect(result, throwsA(const TypeMatcher<ServerException>()));
    },
  );
}
