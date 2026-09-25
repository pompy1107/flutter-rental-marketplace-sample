# Flutter Rental Marketplace Sample

A production-style Flutter sample application for a peer-to-peer rental marketplace.

The project demonstrates how a mobile marketplace can be structured around real-world user flows such as browsing items, filtering by category, viewing product details, selecting a rental period, calculating rental costs, and creating new listings.

## Features

- Browse rental items
- Category-based filtering
- Product detail screens
- Rental request flow
- Date range selection
- Automatic rental cost calculation
- Deposit handling
- Add-product form
- Responsive Material 3 UI
- Local mock data
- Reusable Flutter widgets and navigation flows

## Example User Flow

1. Browse available rental items
2. Open an item and view details
3. Check price, deposit, location and owner information
4. Select a rental period
5. View the calculated rental cost
6. Submit a rental request

The app also includes a simple flow for creating a new product listing.

## Architecture

The project is structured by feature:

```text
lib/
├── core/
├── features/
│   └── items/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── main.dart
