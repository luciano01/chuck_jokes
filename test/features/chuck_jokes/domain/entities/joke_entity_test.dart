import 'package:chuck_jokes/features/chuck_jokes/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  const mockJokeEntity = JokeEntity(
    categories: <String>[],
    createdAt: "",
    iconUrl: "",
    id: "",
    updatedAt: "",
    url: "",
    value: "",
  );

  test('The field categories should return a List of String.', () async {
    expect(mockJokeEntity.categories, isA<List<String>>());
  });

  test('The field createdAt should return a String.', () async {
    expect(mockJokeEntity.createdAt, isA<String>());
  });

  test('The field iconUrl should return a String.', () async {
    expect(mockJokeEntity.iconUrl, isA<String>());
  });

  test('The field id should return a String.', () async {
    expect(mockJokeEntity.id, isA<String>());
  });

  test('The field updatedAt should return a String.', () async {
    expect(mockJokeEntity.updatedAt, isA<String>());
  });

  test('The field url should return a String.', () async {
    expect(mockJokeEntity.url, isA<String>());
  });
  test('The field value should return a String.', () async {
    expect(mockJokeEntity.value, isA<String>());
  });
}
