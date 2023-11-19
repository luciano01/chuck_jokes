import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_jokes/features/chuck_jokes/domain/domain.dart';

class MockJokeCategoriesRepository extends Mock
    implements JokeCategoriesRepository {}

void main() {
  late MockJokeCategoriesRepository mockJokeCategoriesRepository;

  setUp(() {
    mockJokeCategoriesRepository = MockJokeCategoriesRepository();
  });

  test('Should return a List of Category if request is successful.', () async {
    const mockCategory = CategoryEntity(category: 'dev');
    const mockListOfCategory = [mockCategory];

    when(() => mockJokeCategoriesRepository.getCategories())
        .thenAnswer((_) async => const Right(mockListOfCategory));

    final result = await mockJokeCategoriesRepository.getCategories();

    expect(result, const Right(mockListOfCategory));
  });
}
