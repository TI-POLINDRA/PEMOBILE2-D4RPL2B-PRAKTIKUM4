import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/2.png',
              width: 240,
              height: 292,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            const Text(
              "All your favorites",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'sen'),
            ),
            const SizedBox(height: 10),
            const Text(
              "Get all your loved foods in one place,\n"
              "you just place the order we do the rest",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, color: Colors.grey, fontFamily: 'sen'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 4, backgroundColor: Colors.orange),
                const SizedBox(width: 5),
                CircleAvatar(radius: 4, backgroundColor: Colors.orange[100]),
                const SizedBox(width: 5),
                CircleAvatar(radius: 4, backgroundColor: Colors.orange[100]),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 327,
              height: 62,
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7622),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Add your onPressed functionality here
              },
              child: const Text(
                "Skip",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'sen',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.2,
                  letterSpacing: 0,
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
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OnboardingScreen(),
  ));
}
