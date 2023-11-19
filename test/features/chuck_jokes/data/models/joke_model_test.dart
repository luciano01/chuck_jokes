import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:chuck_jokes/features/chuck_jokes/data/data.dart';
import 'package:chuck_jokes/features/chuck_jokes/domain/domain.dart';

import '../../../../utils/json_reader.dart';

void main() {
  setUp(() {});

  const mockJokeModel = JokeModel(
    categories: ['food'],
    createdAt: '',
    iconUrl: '',
    id: '',
    updatedAt: '',
    url: '',
    value: '',
  );

  test('Should be a subclass of JokeEntity', () async {
    expect(mockJokeModel, isA<JokeEntity>());
  });

  test('Should return a valid JokeModel from JSON.', () async {
    final Map<String, dynamic> jsonResponse =
        json.decode(fixture('joke_response.json'));

    final result = JokeModel.fromJson(jsonResponse);

    expect(result, mockJokeModel);
  });
}
