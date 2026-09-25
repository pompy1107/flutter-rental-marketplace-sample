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

The sample separates:

domain models and repository contracts
data sources and repository implementations
presentation and UI logic

This structure is designed to make the project easier to test, maintain and extend.

Tech Stack
Flutter
Dart
Material 3
Git
Local mock data

The project intentionally avoids external backend dependencies so it can be cloned and run immediately.

Screens Included
Home / marketplace
Category results
Product details
Rental request
Add product
Running the Project

Clone the repository:

git clone https://github.com/pompy1107/flutter-rental-marketplace-sample.git

Navigate to the project:

cd flutter-rental-marketplace-sample

Install dependencies:

flutter pub get

Run the application:

flutter run
Purpose

This repository is a portfolio sample designed to demonstrate practical Flutter development, UI implementation, navigation, business-flow modelling and maintainable project structure.

It is based on concepts developed for a real peer-to-peer rental marketplace prototype, with backend integrations and sensitive configuration intentionally excluded.

Future Improvements

Possible extensions include:

REST API integration
authentication
state management
favorites
messaging
payments
push notifications
automated testing
CI/CD
