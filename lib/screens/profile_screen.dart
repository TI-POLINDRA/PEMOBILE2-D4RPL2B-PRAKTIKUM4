import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA), // Warna latar belakang utama
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Profile", style: TextStyle(color: Colors.black)),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header (Avatar + Nama)
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFFFE0CC), // Warna latar belakang avatar
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Vishal Khadok",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "I love fast food",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),

            // Section 1: Personal Info
            buildSection([
              buildMenuItem(Icons.person_outline, "Personal Info", Color(0xFFFF7043)),
              buildMenuItem(Icons.map_outlined, "Addresses", Color(0xFF7E57C2)), // Addresses (Ungu)
            ]),

            // Section 2: Cart & Payment
            buildSection([
              buildMenuItem(Icons.shopping_bag_outlined, "Cart", Color(0xFF42A5F5)), // Cart (Biru)
              buildMenuItem(Icons.favorite_border, "Favourite", Color(0xFFEC407A)), // Favourite (Pink)
              buildMenuItem(Icons.notifications_outlined, "Notifications", Color(0xFFFFA726)),
              buildMenuItem(Icons.payment_outlined, "Payment Method", Color(0xFF29B6F6)),
            ]),

            // Section 3: Settings & Help
            buildSection([
              buildMenuItem(Icons.help_outline, "FAQs", Color(0xFFFF7043)),
              buildMenuItem(Icons.rate_review_outlined, "User Reviews", Color(0xFF26A69A)), // User Reviews (Hijau kebiruan)
              buildMenuItem(Icons.settings_outlined, "Settings", Color(0xFF5C6BC0)),
            ]),

            // Section 4: Logout
            buildSection([
              buildMenuItem(Icons.logout, "Log Out", Color(0xFFE53935), isLogout: true),
            ]),
          ],
        ),
      ),
    );
  }

  // Membungkus daftar item menu dengan background abu-abu
  Widget buildSection(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Warna abu-abu sebagai background section
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: children),
    );
  }

  // Membuat item menu dengan ikon di dalam lingkaran putih
  Widget buildMenuItem(IconData icon, String text, Color iconColor, {bool isLogout = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white, // Latar belakang putih untuk ikon
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 24), // Ikon berwarna
        ),
        title: Text(
          text,
          style: TextStyle(
            color: isLogout ? Colors.red : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
