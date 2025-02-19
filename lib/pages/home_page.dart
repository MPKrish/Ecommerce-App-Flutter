import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Smartphones',
        'icon': Icons.phone_android,
        'items': [
          {'name': 'iPhone 14 Pro', 'price': 999.99, 'image': Icons.phone_iphone},
          {'name': 'Samsung S23', 'price': 899.99, 'image': Icons.phone_android},
          {'name': 'Google Pixel 7', 'price': 799.99, 'image': Icons.phone_android},
          {'name': 'OnePlus 11', 'price': 699.99, 'image': Icons.phone_android},
        ]
      },
      {
        'name': 'Laptops',
        'icon': Icons.laptop,
        'items': [
          {'name': 'MacBook Pro', 'price': 1499.99, 'image': Icons.laptop_mac},
          {'name': 'Dell XPS', 'price': 1299.99, 'image': Icons.laptop},
          {'name': 'HP Spectre', 'price': 1199.99, 'image': Icons.laptop},
          {'name': 'Lenovo ThinkPad', 'price': 1099.99, 'image': Icons.laptop},
        ]
      },
      {
        'name': 'Headphones',
        'icon': Icons.headphones,
        'items': [
          {'name': 'AirPods Pro', 'price': 249.99, 'image': Icons.headphones},
          {'name': 'Sony WH-1000XM4', 'price': 299.99, 'image': Icons.headphones},
          {'name': 'Bose QC45', 'price': 279.99, 'image': Icons.headphones},
          {'name': 'Samsung Buds Pro', 'price': 199.99, 'image': Icons.headphones},
        ]
      },
      {
        'name': 'Smart Watches',
        'icon': Icons.watch,
        'items': [
          {'name': 'Apple Watch S8', 'price': 399.99, 'image': Icons.watch},
          {'name': 'Samsung Watch 5', 'price': 299.99, 'image': Icons.watch},
          {'name': 'Fitbit Sense 2', 'price': 249.99, 'image': Icons.watch},
          {'name': 'Garmin Venu 2', 'price': 349.99, 'image': Icons.watch},
        ]
      },
      {
        'name': 'Cameras',
        'icon': Icons.camera_alt,
        'items': [
          {'name': 'Sony A7 IV', 'price': 2499.99, 'image': Icons.camera_alt},
          {'name': 'Canon R6', 'price': 2299.99, 'image': Icons.camera_alt},
          {'name': 'Nikon Z6 II', 'price': 1999.99, 'image': Icons.camera_alt},
          {'name': 'Fujifilm X-T4', 'price': 1699.99, 'image': Icons.camera_alt},
        ]
      },
      {
        'name': 'Speakers',
        'icon': Icons.speaker,
        'items': [
          {'name': 'Sonos One', 'price': 219.99, 'image': Icons.speaker},
          {'name': 'Bose Home 500', 'price': 299.99, 'image': Icons.speaker},
          {'name': 'JBL Charge 5', 'price': 179.99, 'image': Icons.speaker},
          {'name': 'Marshall Stanmore', 'price': 349.99, 'image': Icons.speaker},
        ]
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/products');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          categoryName: category['name'] as String,
                          products: category['items'] as List<Map<String, dynamic>>,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                category['icon'] as IconData,
                                size: 50,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            category['name'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}