import 'package:flutter/material.dart';

class RentisHomeScreen extends StatefulWidget {
  const RentisHomeScreen({super.key});

  @override
  State<RentisHomeScreen> createState() => _RentisHomeScreenState();
}

class _RentisHomeScreenState extends State<RentisHomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> categories = const [
    {'label': 'Unelte', 'image': 'assets/images/bormasina.png'},
    {'label': 'Curățenie', 'image': 'assets/images/karcher.png'},
    {'label': 'Camping', 'image': 'assets/images/cort.png'},
    {'label': 'Auto', 'image': 'assets/images/remorca.png'},
    {'label': 'Foto', 'image': 'assets/images/logo.png'},
  ];

  final List<Map<String, String>> items = const [
    {
      'title': 'Bormașină Bosch',
      'price': '35 lei / zi',
      'distance': '1,2 km',
      'rating': '4.9',
      'image': 'assets/images/bormasina.png',
      'category': 'Unelte',
      'description':
          'Bormașină Bosch Professional 18V, potrivită pentru lucrări de găurire și înșurubare.',
      'owner': 'Andrei M.',
      'deposit': '150 lei',
      'location': 'Timișoara',
    },
    {
      'title': 'Aparat Kärcher',
      'price': '60 lei / zi',
      'distance': '2,4 km',
      'rating': '4.8',
      'image': 'assets/images/karcher.png',
      'category': 'Curățenie',
      'description':
          'Aparat de spălat cu presiune Kärcher, ideal pentru terase, mașini și pavaje.',
      'owner': 'Mihai P.',
      'deposit': '200 lei',
      'location': 'Timișoara',
    },
    {
      'title': 'Cort 4 persoane',
      'price': '45 lei / zi',
      'distance': '3,1 km',
      'rating': '4.7',
      'image': 'assets/images/cort.png',
      'category': 'Camping',
      'description': 'Cort pentru 4 persoane, impermeabil și ușor de montat.',
      'owner': 'Radu C.',
      'deposit': '100 lei',
      'location': 'Timișoara',
    },
    {
      'title': 'Remorcă auto',
      'price': '100 lei / zi',
      'distance': '4,6 km',
      'rating': '5.0',
      'image': 'assets/images/remorca.png',
      'category': 'Auto',
      'description':
          'Remorcă auto pentru transport diverse bunuri, disponibilă pentru închiriere pe zi.',
      'owner': 'Cristian D.',
      'deposit': '300 lei',
      'location': 'Timișoara',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildHeader(),
                  const SizedBox(height: 22),
                  _buildSearchBar(),
                  const SizedBox(height: 28),
                  _buildSectionTitle(title: 'Categorii', action: 'Vezi toate'),
                  const SizedBox(height: 14),
                  _buildCategories(),
                  const SizedBox(height: 30),
                  _buildSectionTitle(
                    title: 'În apropierea ta',
                    action: 'Vezi toate',
                  ),
                  const SizedBox(height: 14),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = items[index];
                  return _buildItemCard(item);
                }, childCount: items.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.78,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddProductScreen()),
            );
            return;
          }

          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Acasă',
          ),
          NavigationDestination(icon: Icon(Icons.search), label: 'Caută'),
          NavigationDestination(
            icon: Icon(Icons.add_circle_outline),
            selectedIcon: Icon(Icons.add_circle),
            label: 'Adaugă',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            label: 'Închirieri',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(4),
          child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rentis',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    size: 17,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 3),
                  Text(
                    'Timișoara',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 17,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.notifications_none),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Ce ai nevoie să închiriezi?',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 17),
        ),
      ),
    );
  }

  Widget _buildSectionTitle({required String title, required String action}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          action,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 112,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final category = categories[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(
                    categoryName: category['label']!,
                    items: items,
                  ),
                ),
              );
            },
            child: SizedBox(
              width: 82,
              child: Column(
                children: [
                  Container(
                    width: 74,
                    height: 74,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(category['image']!, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    category['label']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildItemCard(Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(item: item),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFECEFED),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(item['image']!, fit: BoxFit.cover),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.favorite_border, size: 19),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['price']!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Colors.black45,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        item['distance']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, size: 15, color: Colors.amber),
                      const SizedBox(width: 3),
                      Text(
                        item['rating']!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  final List<Map<String, String>> items;

  const CategoryScreen({
    super.key,
    required this.categoryName,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final filteredItems = items
        .where((item) => item['category'] == categoryName)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        title: Text(
          categoryName,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: filteredItems.isEmpty
          ? _buildEmptyState(context)
          : GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: filteredItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 14,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (context, index) {
                final item = filteredItems[index];

                return _buildItemCard(context, item);
              },
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 18),
            Text(
              'Momentan nu există produse în această categorie.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(BuildContext context, Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(item: item),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFECEFED),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(item['image']!, fit: BoxFit.cover),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.favorite_border, size: 19),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['price']!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Colors.black45,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        item['distance']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, size: 15, color: Colors.amber),
                      const SizedBox(width: 3),
                      Text(
                        item['rating']!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> item;

  const ProductDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item['title'] ?? 'Detalii produs')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(item['image']!, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'] ?? '',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['price'] ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        item['rating'] ?? '',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 18),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item['distance'] ?? '',
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Descriere',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    item['description'] ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Garanție',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 8),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shield_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          item['deposit'] ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Locație',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 8),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          item['location'] ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Proprietar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 8),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.12),
                          child: Icon(
                            Icons.person,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['owner'] ?? '',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                'Proprietar verificat',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.verified,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RentalRequestScreen(item: item),
                          ),
                        );
                      },
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Solicită închirierea',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RentalRequestScreen extends StatefulWidget {
  final Map<String, String> item;

  const RentalRequestScreen({super.key, required this.item});

  @override
  State<RentalRequestScreen> createState() => _RentalRequestScreenState();
}

class _RentalRequestScreenState extends State<RentalRequestScreen> {
  DateTimeRange? selectedRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F5F3),
        elevation: 0,
        title: const Text('Solicită închirierea'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        widget.item['image']!,
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item['title'] ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.item['price'] ?? '',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 34,
                      height: 34,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Perioada închirierii',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () async {
                        final pickedRange = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                          initialDateRange: selectedRange,
                        );

                        if (pickedRange != null) {
                          setState(() {
                            selectedRange = pickedRange;
                          });
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.date_range_outlined),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                selectedRange == null
                                    ? 'Alege perioada'
                                    : '${selectedRange!.start.day}.${selectedRange!.start.month}.${selectedRange!.start.year}'
                                          ' - '
                                          '${selectedRange!.end.day}.${selectedRange!.end.month}.${selectedRange!.end.year}',
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedRange != null) ...[
                const SizedBox(height: 18),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.receipt_long_outlined,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Rezumat costuri',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Durată',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            '${selectedRange!.end.difference(selectedRange!.start).inDays} zile',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cost închiriere',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            '${(int.tryParse((widget.item['price'] ?? '0').split(' ').first) ?? 0) * selectedRange!.end.difference(selectedRange!.start).inDays} lei',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Garanție',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            widget.item['deposit'] ?? '',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.orange.shade700,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      const Divider(),

                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            '${((int.tryParse((widget.item['price'] ?? '0').split(' ').first) ?? 0) * selectedRange!.end.difference(selectedRange!.start).inDays) + (int.tryParse((widget.item['deposit'] ?? '0').split(' ').first) ?? 0)} lei',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Finalizează închirierea',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adaugă produs')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Titlu produs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Ex: Bormașină Bosch',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Categorie',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                hint: const Text('Alege categoria'),
                items: const [
                  DropdownMenuItem(value: 'Unelte', child: Text('Unelte')),
                  DropdownMenuItem(
                    value: 'Curățenie',
                    child: Text('Curățenie'),
                  ),
                  DropdownMenuItem(value: 'Camping', child: Text('Camping')),
                  DropdownMenuItem(value: 'Auto', child: Text('Auto')),
                  DropdownMenuItem(value: 'Foto', child: Text('Foto / Video')),
                ],
                onChanged: (value) {},
              ),

              const SizedBox(height: 20),

              const Text(
                'Preț / zi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Ex: 50',
                  suffixText: 'lei / zi',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Garanție',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 8),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Ex: 150',
                  suffixText: 'lei',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Locație',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 8),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Ex: Timișoara',
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Descriere',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 8),

              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Descrie pe scurt produsul și starea lui...',
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Fotografii',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 8),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 22,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 34,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Adaugă fotografii',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Poți adăuga până la 5 imagini',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Publică produsul',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
