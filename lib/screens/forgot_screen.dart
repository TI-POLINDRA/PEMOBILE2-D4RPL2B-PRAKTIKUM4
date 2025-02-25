import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Memastikan UI tetap stabil saat keyboard muncul
      body: Stack(
        children: [
          // Background dengan efek kurva
          ClipPath(
            clipper: TCustomCurvedEdges(),
            child: Container(
              width: MediaQuery.of(context).size.width, // Lebar penuh
              height: 260.h,
              color: Colors.black, // Warna header
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Geser ke atas
                children: [
                  SizedBox(height: 110.h), // Mengatur jarak atas agar lebih proporsional
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h), // Memberikan padding agar lebih proporsional
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, // Agar teks rata kiri
              children: [
                SizedBox(height: 255.h), // Mengangkat posisi email lebih ke atas
                Text(
                  "EMAIL",
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8.h), // Jarak antara label dan input
                 TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'example@gmail.com',
                    hintStyle: TextStyle(
                      fontFamily: 'Sen',
                      fontSize: 14.sp,
                    ),
                    fillColor: Color(0xFFF0F5FA), // Warna #F0F5FA
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w), // Padding 20h & geser hintText ke kanan
                  ),
                ),
                SizedBox(height: 20.h), // Menambah lebih banyak jarak ke tombol
               SizedBox(
                  width: double.infinity, // Lebar tombol mengikuti input email
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF7622), // Warna tombol #FF7622
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Border radius tombol
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
              

          // Tombol back dengan padding circular
                    Positioned(
            top: 40.h,
            left: 10.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
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

    // Kurva kiri
    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
      firstCurve.dx, firstCurve.dy, 
      lastCurve.dx, lastCurve.dy
    );

    // Kurva kanan
    final secondFirstCurve = Offset(0, size.height - 20); // Perbaikan
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
      secondFirstCurve.dx, secondFirstCurve.dy,
      secondLastCurve.dx, secondLastCurve.dy
    );

    final thirdFirstCurve = Offset(size.width, size.height - 20); // Perbaikan
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(
      thirdFirstCurve.dx, thirdFirstCurve.dy,
      thirdLastCurve.dx, thirdLastCurve.dy
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}