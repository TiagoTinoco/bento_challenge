import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/components/wave_loading.dart';

class BentoDropdown extends StatefulWidget {
  const BentoDropdown({super.key});

  @override
  State<BentoDropdown> createState() => _BentoDropdownState();
}

class _BentoDropdownState extends State<BentoDropdown> {
  final dropdownController = SingleSelectController('Bacangan, Sambit');
  List<String> data = [
    'Bacangan, Sambit',
    'Brazil, SP - Patriarca',
    'Caribe, Cayman island',
  ];

  Future<List<String>> getFakeRequestData(String filter) async {
    return data.where((e) {
      return e.toLowerCase().contains(filter.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      child: CustomDropdown.searchRequest(
        decoration: CustomDropdownDecoration(
          closedFillColor: Colors.transparent,
          expandedSuffixIcon: SizedBox.shrink(),
          headerStyle: TextStyle(
            fontSize: 15,
            color: BentoColor.secondary.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
          listItemStyle: TextStyle(
            fontSize: 15,
            color: BentoColor.secondary.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
          searchFieldDecoration: SearchFieldDecoration(
            textStyle: TextStyle(color: BentoColor.secondary),
            hintStyle: TextStyle(
              fontSize: 15,
              color: BentoColor.secondary,
            ),
            contentPadding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(maxHeight: 40),
          ),
        ),
        searchHintText: 'Search',
        noResultFoundText: 'Not found your city',
        hideSelectedFieldWhenExpanded: true,
        closedHeaderPadding: const EdgeInsets.all(0),
        items: data,
        searchRequestLoadingIndicator: WaveLoading(),
        excludeSelected: false,
        futureRequest: getFakeRequestData,
        controller: dropdownController,
        futureRequestDelay: const Duration(milliseconds: 2500),
        onChanged: (String? string) {},
      ),
    );
  }
}
