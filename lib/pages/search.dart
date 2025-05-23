import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  String _selectedRating = 'All';
  String _selectedPrice = 'All';

  final List<String> ratingFilters = ['All', '5★', '4★ & up', '3★ & up'];
  final List<String> priceFilters = ['All', 'Low to High', 'High to Low'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(context),
            SizedBox(height: 20),
            Text(
              "Filters",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildChipsSection(),
            SizedBox(height: 20),
            Expanded(child: _buildSearchResultsPlaceholder()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFFE6E6E6)),
            ),
            child: Icon(Icons.arrow_back, size: 18, color: Color(0xFF2E2E2E)),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: SizedBox(
            height: 43,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search here",
                prefixIcon: Icon(Icons.search, color: Color(0xFF0066FF)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFF0F1F5),
                contentPadding: EdgeInsets.only(left: 20, right: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.star_rate, size: 20, color: Color(0xFF0066FF)),
            SizedBox(width: 6),
            Text(
              "Rating",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              ratingFilters.map((rating) {
                final isSelected = _selectedRating == rating;
                return ChoiceChip(
                  label: Text(rating),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      _selectedRating = rating;
                    });
                  },
                  selectedColor: const Color(0xFF0066FF),
                  backgroundColor: const Color(0xFFEFEFEF),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color:
                          isSelected
                              ? Colors.transparent
                              : Colors.grey.shade300,
                    ),
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 30),
        Row(
          children: const [
            Icon(Icons.money, size: 20, color: Color(0xFF0066FF)),
            SizedBox(width: 6),
            Text(
              "Price",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              priceFilters.map((price) {
                final isSelected = _selectedPrice == price;
                return ChoiceChip(
                  label: Text(price),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      _selectedPrice = price;
                    });
                  },
                  selectedColor: const Color(0xFF0066FF),
                  backgroundColor: const Color(0xFFEFEFEF),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color:
                          isSelected
                              ? Colors.transparent
                              : Colors.grey.shade300,
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildSearchResultsPlaceholder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 60, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            'No results found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Try different keywords or filters.',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
