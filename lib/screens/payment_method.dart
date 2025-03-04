import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, color: Colors.black87),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Payment",
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

            // Payment Methods
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  PaymentMethod(
                      iconPath: "assets/icons/cash.png",
                      label: "Cash",
                      isSelected: false),
                  PaymentMethod(
                      iconPath: "assets/icons/visa.png",
                      label: "Visa",
                      isSelected: false),
                  PaymentMethod(
                      iconPath: "assets/icons/mastercard.png",
                      label: "Mastercard",
                      isSelected: true),
                  PaymentMethod(
                      iconPath: "assets/icons/paypal.png",
                      label: "Paypal",
                      isSelected: false),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Selected Card Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icons/mastercard.png",
                            width: 32, height: 32),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Master Card",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "************436",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.black87),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Add New Payment Method
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextButton(
                style: TextButton.styleFrom(
                  side: BorderSide(color: Colors.orange, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "+ ADD NEW",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),

            Spacer(),

            // Total & Pay Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TOTAL:",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$96",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
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
                        "PAY & CONFIRM",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;

  PaymentMethod(
      {required this.iconPath, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isSelected ? Colors.orange.withOpacity(0.2) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.orange : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Center(
              child: Image.asset(iconPath, width: 30, height: 30),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isSelected ? Colors.orange : Colors.black87,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
