import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text('2', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recent Keywords", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: ["Burger", "Sandwich", "Pizza", "Sanwich"]
                  .map((keyword) => Chip(label: Text(keyword)))
                  .toList(),
            ),
            SizedBox(height: 20),
            Text("Suggested Restaurants", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  restaurantTile("Pansi Restaurant", 4.7),
                  restaurantTile("American Spicy Burger Shop", 4.3),
                  restaurantTile("Cafenio Coffee Club", 4.0),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("Popular Fast Food", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Row(
              children: [
                popularFoodTile("European Pizza", "Uttora Coffee House"),
                SizedBox(width: 10),
                popularFoodTile("Buffalo Pizza.", "Cafenio Coffee Club"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget restaurantTile(String name, double rating) {
    return ListTile(
      leading: Container(width: 50, height: 50, color: Colors.grey[300]),
      title: Text(name),
      subtitle: Row(
        children: [
          Icon(Icons.star, color: Colors.orange, size: 16),
          SizedBox(width: 4),
          Text(rating.toString()),
        ],
      ),
    );
  }

  Widget popularFoodTile(String title, String subtitle) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: double.infinity, height: 80, color: Colors.grey[300]),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
