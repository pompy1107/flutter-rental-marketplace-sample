import 'package:flutter_test/flutter_test.dart';
import 'package:rental_marketplace_sample/features/items/domain/rental_item.dart';

void main() {
  test('RentalItem stores values correctly', () {
    const item = RentalItem(
      id: '1',
      title: 'Cordless Drill',
      description: '18V cordless drill',
      pricePerDay: 50,
      currency: 'RON',
      imageUrl: 'assets/images/bormasina.png',
      category: 'DIY',
      isAvailable: true,
    );

    expect(item.id, '1');
    expect(item.title, 'Cordless Drill');
    expect(item.pricePerDay, 50);
    expect(item.currency, 'RON');
    expect(item.category, 'DIY');
    expect(item.isAvailable, true);
  });
}
