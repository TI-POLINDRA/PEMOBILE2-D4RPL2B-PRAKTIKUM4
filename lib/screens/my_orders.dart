import 'package:flutter/material.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text('My Orders', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tabItem('Ongoing', 0),
              _tabItem('History', 1),
            ],
          ),
          Divider(height: 1, color: Colors.grey.shade300),
          Expanded(
            child: _selectedTabIndex == 0 ? _ongoingList() : _historyList(),
          ),
        ],
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.orange : Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          if (isSelected)
            Container(height: 2, width: 60, color: Colors.orange),
        ],
      ),
    );
  }

  Widget _ongoingList() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        _ongoingItem('Food', 'Pizza Hut', 35.25, 3, '#162432'),
        _ongoingItem('Drink', 'McDonald', 40.15, 2, '#242432'),
        _ongoingItem('Drink', 'Starbucks', 10.20, 1, '#240112'),
      ],
    );
  }

  Widget _ongoingItem(String type, String restaurant, double price, int itemsCount, String orderNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(type, style: const TextStyle(fontSize: 14, color: Colors.black54)),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 0.2)],
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8))),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(restaurant, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('\$${price.toStringAsFixed(2)}  |  $itemsCount Items', style: const TextStyle(fontSize: 14, color: Colors.black54)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(orderNumber, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        onPressed: () {},
                        child: const Text('Track Order'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(foregroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), side: const BorderSide(color: Colors.orange)),
                        onPressed: () {},
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _historyList() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        _historyItem('Food', 'Pizza Hut', 35.25, '29 Januari, 12.25', 3, '#162432', 'Completed'),
        _historyItem('Drink', 'McDonald', 40.15, '30 Januari, 12.30', 2, '#242432', 'Completed'),
        _historyItem('Drink', 'Starbucks', 10.20, '30 Januari, 12.30', 1, '#240112', 'Canceled'),
      ],
    );
  }

  Widget _historyItem(String type, String restaurant, double price, String dateTime, int itemsCount, String orderNumber, String status) {
    Color statusColor = status == 'Canceled' ? Colors.red : Colors.green;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(type, style: const TextStyle(fontSize: 14, color: Colors.black54)),
              const SizedBox(width: 6),
              Text(status, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: statusColor)),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 0.2)],
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8))),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(restaurant, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('\$${price.toStringAsFixed(2)}  |  $dateTime • $itemsCount Items',
                              maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(orderNumber, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(foregroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), side: const BorderSide(color: Colors.orange)),
                        onPressed: () {},
                        child: const Text('Rate'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        onPressed: () {},
                        child: const Text('Re-Order'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
