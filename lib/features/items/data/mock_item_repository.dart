import '../domain/item_repository.dart';
import '../domain/rental_item.dart';

class MockItemRepository implements ItemRepository {
  @override
  Future<List<RentalItem>> getItems() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));

    return const [
      RentalItem(
        id: '1',
        title: 'Cordless Drill',
        description: '18V cordless drill, ideal for DIY projects.',
        pricePerDay: 50,
        currency: 'RON',
        imageUrl: 'https://picsum.photos/seed/drill/800/600',
        category: 'DIY',
        isAvailable: true,
      ),
      RentalItem(
        id: '2',
        title: 'Carpet Cleaner',
        description: 'Powerful carpet cleaner for home use.',
        pricePerDay: 80,
        currency: 'RON',
        imageUrl: 'https://picsum.photos/seed/cleaner/800/600',
        category: 'Cleaning',
        isAvailable: true,
      ),
      RentalItem(
        id: '3',
        title: 'Camping Tent',
        description: 'Four-person tent suitable for weekend trips.',
        pricePerDay: 60,
        currency: 'RON',
        imageUrl: 'https://picsum.photos/seed/tent/800/600',
        category: 'Camping',
        isAvailable: false,
      ),
    ];
  }
}
