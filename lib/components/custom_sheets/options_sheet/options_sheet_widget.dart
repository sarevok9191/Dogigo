import '/backend/schema/structs/selectable_option_type_struct.dart';
import 'package:flutter/material.dart';

class OptionsSheetWidget extends StatefulWidget {
  const OptionsSheetWidget({
    super.key,
    this.options,
    this.onChange,
    required this.title,
  });

  final List<SelectableOptionTypeStruct>? options;
  final Future Function(SelectableOptionTypeStruct value)? onChange;
  final String? title;

  @override
  State<OptionsSheetWidget> createState() => _OptionsSheetWidgetState();
}

class _OptionsSheetWidgetState extends State<OptionsSheetWidget> {
  SelectableOptionTypeStruct? selectedValue;
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final allOptions = widget.options ?? [];

    // Filtered options
    final filteredOptions = searchText.isEmpty
        ? allOptions
        : allOptions
            .where((o) =>
                o.title.toLowerCase().contains(searchText.toLowerCase()))
            .toList();

    // Base + dynamic height logic
    final screenHeight = MediaQuery.of(context).size.height;
    const double minHeightFraction = 0.35;
    const double maxHeightFraction = 0.75;

    final double baseHeight = screenHeight * minHeightFraction;
    final double maxHeight = screenHeight * maxHeightFraction;

    // Rough per-item height + header + button space
    const double estimatedItemHeight = 56.0;
    const double topSectionHeight = 140.0; // header + search + padding
    const double buttonHeight = 77.0; // spacing + button

    final double contentHeight =
        filteredOptions.length * estimatedItemHeight +
            topSectionHeight +
            buttonHeight;

    final double popupHeight = contentHeight.clamp(baseHeight, maxHeight);

    return Container(
      height: popupHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Header: Title + Close
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title ?? 'Select',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Search bar if more than 5 options
          if (allOptions.length > 5)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

          // Scrollable List
          Expanded(
            child: filteredOptions.isEmpty
                ? const Center(
                    child: Text(
                      'No matching results',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredOptions.length,
                    itemBuilder: (context, index) {
                      final option = filteredOptions[index];
                      final selected = selectedValue?.id == option.id;

                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          option.title,
                          style: TextStyle(
                            color: selected
                                ? const Color(0xFFF25822)
                                : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Icon(
                          selected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: selected
                              ? const Color(0xFFF25822)
                              : Colors.grey,
                        ),
                        onTap: () {
                          setState(() {
                            selectedValue = option;
                          });
                        },
                      );
                    },
                  ),
          ),

          const SizedBox(height: 20),

          // Continue Button with gradient
          ElevatedButton(
            onPressed: () {
              if (selectedValue != null) {
                widget.onChange?.call(selectedValue!);
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: const Size.fromHeight(57),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 162, 100),
                    Color(0xFFF25822),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(27),
              ),
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(minHeight: 57),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
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
