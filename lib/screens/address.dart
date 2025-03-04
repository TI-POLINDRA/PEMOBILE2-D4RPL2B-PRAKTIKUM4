import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  // Custom Back Button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFECF0F4),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black87,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "My Address",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // List Address
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24),
                children: [
                  AddressCard(
                    iconPath: "assets/icons/home.png", // Gambar Home
                    bgColor: Color(0xFFD1E6FF), // Background biru soft
                    title: "HOME",
                    address: "2464 Royal Ln. Mesa, New Jersey 45463",
                  ),
                  SizedBox(height: 16),
                  AddressCard(
                    iconPath: "assets/icons/work.png", // Gambar Work
                    bgColor: Color(0xFFE6D1FF), // Background ungu soft
                    title: "WORK",
                    address: "3891 Ranchview Dr. Richardson, California 62639",
                  ),
                ],
              ),
            ),

            // Add New Address Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "ADD NEW ADDRESS",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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

// Address Card Widget
class AddressCard extends StatelessWidget {
  final String iconPath;
  final Color bgColor;
  final String title;
  final String address;

  AddressCard({
    required this.iconPath,
    required this.bgColor,
    required this.title,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFECF0F4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Elips dengan background putih dan ikon kecil
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Background putih di dalam elips
              border: Border.all(
                  color: bgColor, width: 2), // Outline sesuai warna bg
            ),
            child: Padding(
              padding: EdgeInsets.all(10), // Padding untuk memperkecil ikon
              child: Image.asset(iconPath, fit: BoxFit.contain),
            ),
          ),
          SizedBox(width: 16),

          // Address Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  address,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Edit & Delete Icons
          IconButton(
            icon: Icon(Icons.edit_square, color: Colors.orange, size: 22),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete_forever_rounded,
                color: Colors.orange, size: 22),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
