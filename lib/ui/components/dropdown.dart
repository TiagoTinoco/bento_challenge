import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

class BentoDropdown extends StatefulWidget {
  const BentoDropdown({super.key});

  @override
  State<BentoDropdown> createState() => _BentoDropdownState();
}

class _BentoDropdownState extends State<BentoDropdown> {
  late TextEditingController _searchController;

  String? selectedCity;
  List<String> cities = [
    'Bacangan, Sambit',
    'Brazil, São Paulo - Patriarca',
    'Caribe, Cayman Island',
  ];
  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = cities;
    _searchController = TextEditingController();
  }

  Future<void> _filterItems(String query) async {
    setState(() {
      filteredCities = cities
          .where((item) => item
              .toLowerCase() //
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search a city',
                    prefixIcon: Icon(
                      Icons.search,
                      color: BentoColor.secondary,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: BentoColor.secondary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: _filterItems,
                ),
              ),
              Expanded(
                child: filteredCities.isEmpty
                    ? BentoTextBodyDF(
                        'City not found',
                        style: TextStyle(
                          color: BentoColor.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : ListView(
                        children: filteredCities.map((String city) {
                          return ListTile(
                            title: BentoTextBodyDF(
                              city,
                              style: TextStyle(
                                color: BentoColor.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () {
                              setState(() => selectedCity = city);
                              Navigator.pop(context);
                            },
                          );
                        }).toList(),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 140,
            child: Expanded(
              child: BentoTextCaptionDF(
                selectedCity ?? cities[0],
                style: TextStyle(
                  color: BentoColor.secondary.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: BentoColor.secondary,
          ),
        ],
      ),
    );
  }
}
