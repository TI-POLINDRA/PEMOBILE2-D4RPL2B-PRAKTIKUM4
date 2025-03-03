import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/Back.png',
            width: 40,
            height: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontFamily: 'Sen',
            fontWeight: FontWeight.w400,
            fontSize: 17, // Ukuran untuk title Edit Profile
            height: 1.29,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        Color.fromRGBO(255, 191, 109, 1), // Warna pakai RGB(A)
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.edit, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            buildTextField('FULL NAME', 'Ahmad Zohari'),
            SizedBox(height: 16),
            buildTextField('EMAIL', 'Ahmadzohari@gmail.com'),
            SizedBox(height: 16),
            buildTextField('PHONE NUMBER', '2205033'),
            SizedBox(height: 16),
            buildTextField('BIO', 'Praktikum 4', maxLines: 3),
            SizedBox(height: 24),
            Container(
              width: 327,
              height: 62,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF7622),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontSize: 14, // Ukuran untuk teks tombol SAVE
                      fontWeight: FontWeight.bold,
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

  Widget buildTextField(String label, String value, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Sen',
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
            fontSize: 14, // Ukuran untuk label input
          ),
        ),
        SizedBox(height: 8),
        TextField(
          readOnly: true,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: TextStyle(
            fontFamily: 'Sen',
            fontSize: 14, // Ukuran untuk isi input field
            fontWeight: FontWeight.w400,
          ),
          controller: TextEditingController(text: value),
        ),
      ],
    );
  }
}
