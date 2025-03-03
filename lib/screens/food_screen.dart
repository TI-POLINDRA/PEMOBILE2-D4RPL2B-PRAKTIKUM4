import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> burgers = [
      {"name": "Burger Bistro", "restaurant": "Rose Garden", "price": 40},
      {"name": "Smokin' Burger", "restaurant": "Cafenio Restaurant", "price": 60},
      {"name": "Buffalo Burgers", "restaurant": "Kaji Firm Kitchen", "price": 75},
      {"name": "Bullseye Burgers", "restaurant": "Kabab Restaurant", "price": 94},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              "BURGER",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Sen'),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.orange),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Popular Burgers",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Sen'),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: burgers.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          burgers[index]['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Sen'),
                        ),
                        Text(
                          burgers[index]['restaurant'],
                          style: const TextStyle(color: Colors.grey, fontFamily: 'Sen'),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${burgers[index]['price']}",
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Sen'),
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 15,
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Open Restaurants",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Sen'),
            ),
            const SizedBox(height: 10),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 5),
                Text("4.7", style: TextStyle(fontFamily: 'Sen')),
                SizedBox(width: 10),
                Icon(Icons.delivery_dining, color: Colors.orange),
                SizedBox(width: 5),
                Text("Free", style: TextStyle(fontFamily: 'Sen')),
                SizedBox(width: 10),
                Icon(Icons.timer, color: Colors.orange),
                SizedBox(width: 5),
                Text("20 min", style: TextStyle(fontFamily: 'Sen')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}