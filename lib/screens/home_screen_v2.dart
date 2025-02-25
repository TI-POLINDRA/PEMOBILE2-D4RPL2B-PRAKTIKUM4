import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenV2(),
    );
  }
}

class HomeScreenV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            _buildHeader(),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildCategorySection(),
            const SizedBox(height: 20),
            _buildRestaurantSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("DELIVER TO",
                style: GoogleFonts.sen(
                    fontSize: 12,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text("Halal Lab Office",
                style:
                    GoogleFonts.sen(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        badges.Badge(
          badgeContent: const Text("2", style: TextStyle(color: Colors.white)),
          child: Icon(Icons.shopping_cart, size: 28),
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search dishes, restaurants",
        hintStyle: GoogleFonts.sen(fontSize: 14),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("All Categories"),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryCard("Pizza", "\$70"),
              _buildCategoryCard("Burger", "\$50"),
              _buildCategoryCard("Pasta", "\$60"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCategoryCard(String title, String price) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10))),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style:
                    GoogleFonts.sen(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Starting",
                  style: GoogleFonts.sen(fontSize: 13, color: Colors.grey)),
              Text(price,
                  style: GoogleFonts.sen(fontSize: 13, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Open Restaurants"),
        const SizedBox(height: 10),
        _buildRestaurantCard("Rose Garden Restaurant",
            "Burger - Chicken - Wings", "4.7", "Free", "20 min"),
      ],
    );
  }

  Widget _buildRestaurantCard(String name, String description, String rating,
      String delivery, String time) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(12), // Border radius untuk gambar
            child: Container(
              height: 100,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(height: 10),
          Text(name,
              style:
                  GoogleFonts.sen(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(description,
              style: GoogleFonts.sen(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 18),
              Text(" $rating", style: GoogleFonts.sen(fontSize: 12)),
              const SizedBox(width: 10),
              Icon(Icons.delivery_dining, color: Colors.green, size: 18),
              Text(" $delivery", style: GoogleFonts.sen(fontSize: 12)),
              const SizedBox(width: 10),
              Icon(Icons.access_time, color: Colors.red, size: 18),
              Text(" $time", style: GoogleFonts.sen(fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.sen(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("See All",
            style: GoogleFonts.sen(fontSize: 14, color: Colors.orange)),
      ],
    );
  }
}
