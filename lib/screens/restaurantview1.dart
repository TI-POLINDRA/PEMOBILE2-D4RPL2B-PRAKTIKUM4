import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text("Restaurant View"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFF98A8B8),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Spicy Restaurant",
              style: GoogleFonts.sen(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
              style: GoogleFonts.sen(color: Colors.grey),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 4),
                Text("4.7", style: GoogleFonts.sen()),
                SizedBox(width: 16),
                Icon(Icons.local_shipping, color: Colors.orange),
                SizedBox(width: 4),
                Text("Free", style: GoogleFonts.sen()),
                SizedBox(width: 16),
                Icon(Icons.access_time, color: Colors.orange),
                SizedBox(width: 4),
                Text("20 min", style: GoogleFonts.sen()),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                CategoryButton(text: "Burger", isSelected: true),
                CategoryButton(text: "Sandwich"),
                CategoryButton(text: "Pizza"),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Burger (10)",
              style: GoogleFonts.sen(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                children: [
                  FoodCard(
                      name: "Burger Ferguson",
                      restaurant: "Spicy Restaurant",
                      price: "\$40"),
                  FoodCard(
                      name: "Rockin' Burgers",
                      restaurant: "Cafecafachino",
                      price: "\$40"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CategoryButton({super.key, required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.orange : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Text(text, style: GoogleFonts.sen()),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String name;
  final String restaurant;
  final String price;

  const FoodCard({super.key, required this.name, required this.restaurant, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
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
              decoration: BoxDecoration(
                color: Color(0xFF98A8B8),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: GoogleFonts.sen(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(restaurant, style: GoogleFonts.sen(color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(price, style: GoogleFonts.sen(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 8, bottom: 8),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40, // Ukuran lingkaran
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      textTheme: GoogleFonts.senTextTheme(),
    ),
    home: RestaurantView(),
  ));
}
