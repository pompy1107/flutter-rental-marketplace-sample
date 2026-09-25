import 'rental_item.dart';

abstract class ItemRepository {
  Future<List<RentalItem>> getItems();
}
