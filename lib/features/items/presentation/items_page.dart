import 'package:flutter/material.dart';

import '../data/mock_item_repository.dart';
import '../domain/rental_item.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final _repository = MockItemRepository();

  late Future<List<RentalItem>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = _repository.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rental Marketplace')),
      body: FutureBuilder<List<RentalItem>>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong.'));
          }

          final items = snapshot.data ?? [];

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = items[index];

              return Card(
                child: ListTile(
                  title: Text(item.title),
                  subtitle: Text(
                    '${item.description}\n'
                    '${item.pricePerDay.toStringAsFixed(0)} ${item.currency} / day',
                  ),
                  isThreeLine: true,
                  trailing: Icon(
                    item.isAvailable ? Icons.check_circle : Icons.cancel,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
