import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_jokes/core/core.dart';
import 'package:chuck_jokes/features/chuck_jokes/data/data.dart';

class MockJokeByCategoryRemoteDataSource extends Mock
    implements JokeByCategoryRemoteDataSource {}

class MockNetworkCheck extends Mock implements NetworkCheck {}

void main() {
  late MockNetworkCheck mockNetworkCheck;
  late MockJokeByCategoryRemoteDataSource mockJokeByCategoryRemoteDataSource;
  late JokeByCategoryRepositoryImpl jokeByCategoryRepositoryImpl;

  setUp(() {
    mockNetworkCheck = MockNetworkCheck();
    mockJokeByCategoryRemoteDataSource = MockJokeByCategoryRemoteDataSource();
    jokeByCategoryRepositoryImpl = JokeByCategoryRepositoryImpl(
      mockJokeByCategoryRemoteDataSource,
      mockNetworkCheck,
    );
  });

  const mockJokeModel = JokeModel(
    categories: [],
    createdAt: '',
    iconUrl: '',
    id: '',
    updatedAt: '',
    url: '',
    value: '',
  );

  const mockCategory = 'dev';

  test('Check if has connection', () async {
    when(() => mockNetworkCheck.hasConnection).thenAnswer((_) async => true);
  });

  test('Should return a JokeModel from Datasource if has connection.',
      () async {
    when(() => mockNetworkCheck.hasConnection).thenAnswer((_) async => true);

    when(() => mockJokeByCategoryRemoteDataSource.getJokeByCategory(
        category: mockCategory)).thenAnswer((_) async => mockJokeModel);

    final result = await jokeByCategoryRepositoryImpl.getJokeByCategory(
        category: mockCategory);

    expect(result, equals(const Right(mockJokeModel)));
    verify(() => mockJokeByCategoryRemoteDataSource.getJokeByCategory(
        category: mockCategory));
  });

  test('Should return a ServerException from Datasource if no has connection.',
      () async {
    when(() => mockNetworkCheck.hasConnection).thenAnswer((_) async => false);

    when(() => mockJokeByCategoryRemoteDataSource.getJokeByCategory(
        category: mockCategory)).thenThrow(ServerException());

    final result = await jokeByCategoryRepositoryImpl.getJokeByCategory(
        category: mockCategory);

    expect(result, equals(Left(ServerException())));
    verifyNoMoreInteractions(mockJokeByCategoryRemoteDataSource);
  });
}
