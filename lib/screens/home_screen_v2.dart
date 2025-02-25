import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Pizza', 'price': '\$70'},
    {'name': 'Burger', 'price': '\$50'},
    {'name': 'Pasta', 'price': '\$40'},
    {'name': 'Sushi', 'price': '\$90'},
  ];

  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Rose Garden Restaurant',
      'categories': 'Burger • Chicken • Rice • Wings',
      'rating': 4.7,
      'delivery': 'Free',
      'time': '20 min',
    },
    {
      'name': 'Ocean View Cafe',
      'categories': 'Seafood • Sushi • Asian',
      'rating': 4.5,
      'delivery': 'Free',
      'time': '25 min',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.menu, color: Colors.black),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DELIVER TO',
                  style: GoogleFonts.sen(
                    fontSize: 12,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Halal Lab office',
                      style: GoogleFonts.sen(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ],
                ),
              ],
            ),
            Spacer(),
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.shopping_bag, color: Colors.white),
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      '2',
                      style: GoogleFonts.sen(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey Halal, Good Afternoon!',
                style: GoogleFonts.sen(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search dishes, restaurants',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // 🔹 All Categories Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Categories',
                    style: GoogleFonts.sen(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See All >',
                    style: GoogleFonts.sen(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // 🔹 Scrollable Categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/food_placeholder.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            category['name']!,
                            style: GoogleFonts.sen(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Starting ${category['price']}',
                            style: GoogleFonts.sen(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 30),

              // 🔹 Open Restaurants Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Open Restaurants',
                    style: GoogleFonts.sen(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See All >',
                    style: GoogleFonts.sen(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // 🔹 List of Restaurants
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: restaurants.map((restaurant) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        // decoration: BoxDecoration(
                        //   color: Colors.grey.shade100,
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              restaurant['name'],
                              style: GoogleFonts.sen(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              restaurant['categories'],
                              style: GoogleFonts.sen(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  restaurant['rating'].toString(),
                                  style: GoogleFonts.sen(fontSize: 14),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.delivery_dining,
                                    color: Colors.orange, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  restaurant['delivery'],
                                  style: GoogleFonts.sen(fontSize: 14),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.access_time,
                                    color: Colors.orange, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  restaurant['time'],
                                  style: GoogleFonts.sen(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
