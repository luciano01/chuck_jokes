import 'package:chuck_jokes/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_jokes/features/chuck_jokes/domain/domain.dart';

class MockJokeByCategoryRepository extends Mock
    implements JokeByCategoryRepository {}

void main() {
  late MockJokeByCategoryRepository mockJokeByCategoryRepository;
  late JokeByCategoryUsecaseImpl jokeByCategoryUsecaseImpl;

  setUp(() {
    mockJokeByCategoryRepository = MockJokeByCategoryRepository();
    jokeByCategoryUsecaseImpl = JokeByCategoryUsecaseImpl(
      mockJokeByCategoryRepository,
    );
  });

  test(
      'Should return a Joke by Category from JokeByCategoryRepository when request is successful.',
      () async {
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

    final result = await jokeByCategoryUsecaseImpl.getJokeByCategory(
        category: mockCategory);

    expect(result, const Right(mockJokeEntity));
  });

  test(
      'Should return an Exception from JokeByCategoryRepository when request is fail.',
      () async {
    const mockCategory = 'Dev';

    when(() => mockJokeByCategoryRepository.getJokeByCategory(
            category: mockCategory))
        .thenAnswer((_) async => Left(ServerException()));

    final result = await jokeByCategoryUsecaseImpl.getJokeByCategory(
        category: mockCategory);

    expect(result, Left(ServerException()));
  });
}
