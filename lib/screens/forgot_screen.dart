import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background dengan efek kurva
          ClipPath(
            clipper: TCustomCurvedEdges(),
            child: Container(
              width: MediaQuery.of(context).size.width, // Lebar penuh
              height: 250.h,
              color: Colors.black, // Warna header
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Geser ke atas
                children: [
                  SizedBox(height: 120.h), // Tambah jarak atas
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5.h), // Mengurangi jarak antar teks
                  Text(
                    "Please sign in to your existing account",
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontSize: 16.sp,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Isi konten di bawah header
          Align(
            alignment: Alignment(0, 0.1), // Menggeser form lebih ke bawah lagi
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.w), // Padding horizontal
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Agar teks rata kiri
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h), // Jarak antara label dan input
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                      height: 20.h), // Menambah lebih banyak jarak ke tombol
                  SizedBox(
                    width:
                        double.infinity, // Lebar tombol mengikuti input email
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Border radius tombol
                        ),
                      ),
                      child: Text(
                        "SEND CODE",
                        style: TextStyle(
                          fontFamily: 'Sen',
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tombol back
          Positioned(
            top: 40.h,
            left: 10.w,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper untuk efek kurva
class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondFirstCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
