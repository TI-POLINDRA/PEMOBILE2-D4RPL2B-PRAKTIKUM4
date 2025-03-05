import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AddNewAddressScreen(),
  ));
}

class AddNewAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header lebih besar
          Stack(
            children: [
              Container(
                height: 300, // Ukuran lebih besar
                color: Colors.blueGrey[100],
              ),
              Positioned(
                top: 50,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  radius: 20,
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
              Positioned(
                top: 180, // Posisi lebih rendah menyesuaikan header baru
                left: MediaQuery.of(context).size.width / 2 - 60,
                child: Column(
                  children: [
                    Tooltip(
                      message: "Move to edit location",
                      preferBelow: false,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "Move to edit location",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 40, // Lebih besar
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Bagian utama lebih kecil
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Text("ADDRESS", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  _buildBox(
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.locationDot, color: Colors.blueGrey),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "3235 Royal Ln. Mesa, New Jersey 34567",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("STREET"),
                            _buildBox(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Hason Nagar",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("POST CODE"),
                            _buildBox(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "34567",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text("APARTMENT"),
                  _buildBox(
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none, hintText: "345"),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text("LABEL AS"),
                  Row(
                    children: [
                      ChoiceChip(
                        label: Text(
                          "Home",
                          style: TextStyle(color: Colors.white), // Ubah warna teks jadi putih
                        ),
                        selected: true,
                        onSelected: (val) {},
                        selectedColor: Colors.orange,
                        backgroundColor: Colors.white,
                        showCheckmark: false, // Hilangkan icon check
                      ),

                      SizedBox(width: 10),
                      ChoiceChip(
                        label: Text("Work"),
                        selected: false,
                        onSelected: (val) {},
                      ),
                      SizedBox(width: 10),
                      ChoiceChip(
                        label: Text("Other"),
                        selected: false,
                        onSelected: (val) {},
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(double.infinity, 60),
                    ),
                    onPressed: () {},
                    child: Text("SAVE LOCATION", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBox({required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
