import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_jokes/features/chuck_jokes/domain/domain.dart';

class MockJokeByCategoryRepository extends Mock
    implements JokeByCategoryRepository {}

void main() {
  late MockJokeByCategoryRepository mockJokeByCategoryRepository;

  setUp(() {
    mockJokeByCategoryRepository = MockJokeByCategoryRepository();
  });

  test('Should return a Joke By Category if request is successful.', () async {
    const mockJokeEntity = JokeEntity(
      categories: [],
      createdAt: '',
      iconUrl: '',
      id: '',
      updatedAt: '',
      url: '',
      value: '',
    );

    const mockCategory = 'Dev';

    when(() => mockJokeByCategoryRepository.getJokeByCategory(
            category: mockCategory))
        .thenAnswer((_) async => const Right(mockJokeEntity));

    final result = await mockJokeByCategoryRepository.getJokeByCategory(
        category: mockCategory);

    expect(result, const Right(mockJokeEntity));
  });
}
