import 'package:flutter_test/flutter_test.dart';
import 'package:rental_marketplace_sample/features/items/data/mock_item_repository.dart';

void main() {
  test('MockItemRepository returns rental items', () async {
    final repository = MockItemRepository();

    final items = await repository.getItems();

    expect(items, isNotEmpty);
    expect(items.length, 3);
    expect(items.first.title, 'Cordless Drill');
  });
}
