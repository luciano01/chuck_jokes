import 'package:chuck_jokes/features/chuck_jokes/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('The [category] field should be a String type.', () async {
    const mockCategory = CategoryEntity(category: 'dev');
    expect(mockCategory.category, isA<String>());
  });
}
