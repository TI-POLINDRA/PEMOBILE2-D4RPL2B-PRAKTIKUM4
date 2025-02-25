import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _paymentMethodIcon('assets/images/Cash.png', 'Cash'),
                _paymentMethodIcon('assets/images/Visa.png', 'Visa'),
                _paymentMethodIcon('assets/images/Mastercard.png', 'Mastercard',
                    selected: true),
                _paymentMethodIcon('assets/images/Paypal.png', 'PayPal'),
              ],
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Clipped.png',
                        width: 100, height: 100),
                    SizedBox(height: 10),
                    Text(
                      'No master card added',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text('You can add a mastercard and save it for later',
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                width: 327,
                height: 62,
                decoration: BoxDecoration(
                  color: Color(0xFFF0F5FA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text('+ ADD NEW',
                        style: TextStyle(color: Color(0xFFFF7622))),
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Text('TOTAL',
                    style: TextStyle(fontSize: 14, color: Color(0xFFA0A5BA))),
                SizedBox(width: 8),
                Text('\$96',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF7622),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'PAY & CONFIRM',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentMethodIcon(String imagePath, String label,
      {bool selected = false}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF0F5FA),
                borderRadius: BorderRadius.circular(16),
                border: selected ? Border.all(color: Color(0xFFFF7622), width: 2) : null,
              ),
              child: Image.asset(imagePath, width: 30, height: 30),
            ),
            if (selected)
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Color(0xFFFF7622),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 16),
              ),
          ],
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
