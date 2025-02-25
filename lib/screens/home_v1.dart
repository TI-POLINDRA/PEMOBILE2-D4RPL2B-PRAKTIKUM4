import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeV1Screen extends StatelessWidget {
  const HomeV1Screen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home V1')),
      body: const Center(
        child: Text('Welcome to Home V1!'),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🏷️ Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DELIVER TO',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Halal Lab office',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: Icon(Icons.receipt_long, color: Colors.white),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.deepOrange,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '2',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 👋 Greeting
              const Text(
                'Hey Halal,',
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'Good Afternoon!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // 🔍 Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search dishes, restaurants',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 🏷️ Category List
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryItem('All', true),
                    categoryItem('Hot Dog', false),
                    categoryItem('Burger', false),
                    categoryItem('Pizza', false),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 🍽️ Open Restaurants
              Expanded(
                child: ListView(
                  children: [
                    restaurantCard(
                      'Rose Garden Restaurant',
                      'Burger - Chicken - Wings',
                      4.7,
                      'Free',
                      '20 min',
                    ),
                    restaurantCard(
                      'Urban Bites',
                      'Pizza - Pasta - Salads',
                      4.5,
                      '\$5',
                      '30 min',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔸 Category Button
  Widget categoryItem(String title, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orangeAccent : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isSelected
            ? [const BoxShadow(color: Colors.orangeAccent, blurRadius: 5)]
            : [],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // 🔸 Restaurant Card
  Widget restaurantCard(String name, String description, double rating,
      String deliveryFee, String time) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(description, style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 18),
                    Text('$rating'),
                    const SizedBox(width: 12),
                    const Icon(Icons.delivery_dining,
                        color: Colors.orange, size: 18),
                    Text(deliveryFee),
                    const SizedBox(width: 12),
                    const Icon(Icons.access_time,
                        color: Colors.orange, size: 18),
                    Text(time),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
