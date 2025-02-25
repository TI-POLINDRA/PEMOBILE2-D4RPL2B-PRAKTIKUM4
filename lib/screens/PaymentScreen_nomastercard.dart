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
                _paymentMethodIcon(Icons.money, 'Cash'),
                _paymentMethodIcon(Icons.credit_card, 'Visa'),
                _paymentMethodIcon(Icons.credit_card, 'Mastercard', selected: true),
                _paymentMethodIcon(Icons.account_balance_wallet, 'PayPal'),
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
                    Icon(Icons.credit_card, size: 50, color: Color(0xFFFF7622)),
                    SizedBox(height: 10),
                    Text(
                      'No master card added',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text('You can add a mastercard and save it for later',
                        textAlign: TextAlign.center),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: Text('+ ADD NEW',
                          style: TextStyle(color: Color(0xFFFF7622))),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Text(
              'TOTAL:   \$96',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentMethodIcon(IconData icon, String label, {bool selected = false}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: selected ? Color(0xFFFF7622) : Colors.grey.shade300,
          child: Icon(icon, color: selected ? Colors.white : Colors.black),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
