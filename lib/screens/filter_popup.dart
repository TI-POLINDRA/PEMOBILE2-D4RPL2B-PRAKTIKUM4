import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterPopup extends StatefulWidget {
  const FilterPopup({super.key});

  @override
  State<FilterPopup> createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  Set<String> selectedOffers = {};
  String? selectedDeliveryTime;
  String? selectedPricing;
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 347,
        height: 649,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildSectionTitle("OFFERS"),
            _buildOffers(),
            _buildSectionTitle("DELIVER TIME"),
            _buildDeliveryTime(),
            _buildSectionTitle("PRICING"),
            _buildPricing(),
            _buildSectionTitle("RATING"),
            _buildRating(),
            const SizedBox(height: 16),
            _buildFilterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Filter your search",
          style: GoogleFonts.sen(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title,
          style: GoogleFonts.sen(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
      ),
    );
  }

  Widget _buildOffers() {
  List<String> offers = [
    "Delivery",
    "Pick Up",
    "Offer",
    "Online payment available"
  ];
  return Wrap(
    spacing: 12,
    runSpacing: 0,
    children: offers.map((offer) {
      bool isSelected = selectedOffers.contains(offer);
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: _buildSelectableChip(
          label: offer,
          isSelected: isSelected,
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedOffers.remove(offer);
              } else {
                selectedOffers.add(offer);
              }
            });
          },
        ),
      );
    }).toList(),
  );
}


  Widget _buildSelectableChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? Colors.orange : Colors.grey),
        ),
        child: Text(
          label,
          style: GoogleFonts.sen(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryTime() {
    List<String> times = ["10-15 min", "20 min", "30 min"];
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: times.map((time) {
          bool isSelected = selectedDeliveryTime == time;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedDeliveryTime = isSelected ? null : time;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.orange : Colors.white,
                  borderRadius: BorderRadius.circular(33),
                  border: Border.all(
                    color: isSelected ? Colors.orange : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    time,
                    style: GoogleFonts.sen(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPricing() {
    List<String> pricingOptions = ["\$", "\$\$", "\$\$\$"];
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Wrap(
        spacing: 12,
        children: pricingOptions.map((price) {
          bool isSelected = selectedPricing == price;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedPricing = isSelected ? null : price;
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.orange : Colors.grey.shade300,
                  width: 2,
                ),
                color: isSelected ? Colors.orange : Colors.white,
              ),
              child: Center(
                child: Text(
                  price,
                  style: GoogleFonts.sen(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRating() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(5, (index) {
          int starIndex = index + 1;
          bool isSelected = starIndex <= selectedRating;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedRating = starIndex;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    isSelected ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                    size: 20,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFilterButton() {
    return SizedBox(
      width: 307,
      height: 62,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(
          "FILTER",
          style: GoogleFonts.sen(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
} 