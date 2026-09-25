import 'package:flutter/material.dart';
import 'features/items/presentation/rentis_home_screen.dart';

void main() {
  runApp(const RentalMarketplaceApp());
}

class RentalMarketplaceApp extends StatelessWidget {
  const RentalMarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental Marketplace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const RentisHomeScreen(),
    );
  }
}
