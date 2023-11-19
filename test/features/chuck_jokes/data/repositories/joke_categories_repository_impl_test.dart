import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_jokes/core/core.dart';
import 'package:chuck_jokes/features/chuck_jokes/data/data.dart';
import 'package:chuck_jokes/features/chuck_jokes/domain/domain.dart';

class MockJokeCategoriesRemoteDatasource extends Mock
    implements JokeCategoriesRemoteDataSource {}

class MockNetworkCheck extends Mock implements NetworkCheck {}

void main() {
  late MockJokeCategoriesRemoteDatasource mockJokeCategoriesRemoteDatasource;
  late MockNetworkCheck mockNetworkCheck;
  late JokeCategoriesRepositoryImpl jokeCategoriesRepositoryImpl;

  setUp(() {
    mockJokeCategoriesRemoteDatasource = MockJokeCategoriesRemoteDatasource();
    mockNetworkCheck = MockNetworkCheck();
    jokeCategoriesRepositoryImpl = JokeCategoriesRepositoryImpl(
      mockJokeCategoriesRemoteDatasource,
      mockNetworkCheck,
    );
  });

  test('Check if has connection', () async {
    when(() => mockNetworkCheck.hasConnection).thenAnswer((_) async => true);
  });

  test('Should return a List of Categories from Datasource if has connection.',
      () async {
    const mockCategory = CategoryEntity(category: 'dev');
    const mockListOfCategory = [mockCategory];

    when(() => mockNetworkCheck.hasConnection).thenAnswer((_) async => true);

    when(() => mockJokeCategoriesRemoteDatasource.getCategories())
        .thenAnswer((_) async => mockListOfCategory);

    final result = await jokeCategoriesRepositoryImpl.getCategories();

    expect(result, equals(const Right(mockListOfCategory)));
    verify(() => mockJokeCategoriesRemoteDatasource.getCategories());
  });

  test('Should return a ServerException from Datasource if no has connection.',
      () async {
    when(() => mockNetworkCheck.hasConnection).thenAnswer((_) async => false);

    when(() => mockJokeCategoriesRemoteDatasource.getCategories())
        .thenThrow(ServerException());

    final result = await jokeCategoriesRepositoryImpl.getCategories();

    expect(result, equals(Left(ServerException())));
    verifyNoMoreInteractions(mockJokeCategoriesRemoteDatasource);
  });
}
