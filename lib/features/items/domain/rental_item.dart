class RentalItem {
  final String id;
  final String title;
  final String description;
  final double pricePerDay;
  final String currency;
  final String imageUrl;
  final String category;
  final bool isAvailable;

  const RentalItem({
    required this.id,
    required this.title,
    required this.description,
    required this.pricePerDay,
    required this.currency,
    required this.imageUrl,
    required this.category,
    required this.isAvailable,
  });
}
