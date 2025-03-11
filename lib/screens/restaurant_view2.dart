import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RestaurantDetailPage(),
  ));
}

class RestaurantDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.more_horiz),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Text(" 4.7 "),
                      SizedBox(width: 10),
                      Icon(Icons.local_shipping, color: Colors.grey),
                      Text(" Free "),
                      SizedBox(width: 10),
                      Icon(Icons.access_time, color: Colors.red),
                      Text(" 20 min "),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Spicy Restaurant",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante veneatis dapibus posuere velit aliquet.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      _buildCategoryButton("Burger", true),
                      _buildCategoryButton("Sandwich", false),
                      _buildCategoryButton("Pizza", false),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Burger (10)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFoodItem("Burger Ferguson", "Spicy Restaurant", 40),
                        _buildFoodItem("Rockin' Burgers", "Cafecafachino", 40),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String text, bool isSelected) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        backgroundColor: isSelected ? Colors.orange : Colors.white,
        label: Text(text, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
      ),
    );
  }

  Widget _buildFoodItem(String name, String restaurant, int price) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[300],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 5),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(restaurant, style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text("\$$price", style: TextStyle(fontWeight: FontWeight.bold)),
            IconButton(
              icon: Icon(Icons.add_circle, color: Colors.orange),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
