import 'package:flutter/material.dart';

class UrgentChipDropdown extends StatefulWidget {
  final List<String> items;
  final String title;

  const UrgentChipDropdown({
    super.key,
    required this.items,
    this.title = 'Select Item',
  });

  @override
  UrgentChipDropdownState createState() => UrgentChipDropdownState();
}

class UrgentChipDropdownState extends State<UrgentChipDropdown> {
  final ValueNotifier<String?> _selectedItemNotifier =
      ValueNotifier<String?>(null);

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      builder: (_) {
        return _BottomSheetContent(
          items: widget.items,
          title: widget.title,
          selectedItemNotifier: _selectedItemNotifier,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedItemNotifier,
      builder: (context, selectedItem, _) {
        final selected = selectedItem != null;
        return ActionChip(
          onPressed: () => _showBottomSheet(context),
          side: BorderSide(
            color: selected ? Colors.transparent : Colors.grey.shade300,
            width: 1.0,
          ),
          label: Text(selectedItem ?? widget.title),
          backgroundColor:
              selected ? Colors.blue.withOpacity(0.3) : Colors.grey.shade200,
          labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: selected ? Colors.black87 : Colors.grey.shade700,
              ),
        );
      },
    );
  }

  @override
  void dispose() {
    _selectedItemNotifier.dispose();
    super.dispose();
  }
}

class _BottomSheetContent extends StatelessWidget {
  final List<String> items;
  final String title;
  final ValueNotifier<String?> selectedItemNotifier;

  const _BottomSheetContent({
    required this.title,
    required this.items,
    required this.selectedItemNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Divider(
              height: 14,
              thickness: 2,
              color: Colors.grey.shade300,
            ),
            Wrap(
              spacing: 6.0,
              runSpacing: 0.0,
              children: items.map((item) {
                return ValueListenableBuilder<String?>(
                  valueListenable: selectedItemNotifier,
                  builder: (context, selectedItem, _) {
                    final isSelected = selectedItem == item;
                    return ChoiceChip(
                      showCheckmark: false,
                      visualDensity: VisualDensity.compact,
                      side: BorderSide(
                        color: isSelected
                            ? Colors.transparent
                            : Colors.grey.shade300,
                        width: 1.0,
                      ),
                      padding: EdgeInsets.zero,
                      label: Text(item),
                      labelStyle:
                          Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: isSelected
                                    ? Colors.black87
                                    : Colors.grey.shade700,
                              ),
                      selected: isSelected,
                      onSelected: (_) {
                        selectedItemNotifier.value = isSelected ? null : item;
                      },
                      selectedColor: Colors.blue.withOpacity(0.25),
                      backgroundColor: Colors.grey.shade50,
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                selectedItemNotifier.value = null;
              },
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: DropdownExample()));
}

class DropdownExample extends StatelessWidget {
  const DropdownExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Dropdown Example')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: UrgentChipDropdown(
          items: [
            'Apartment',
            'Villa',
            'Farm',
            'Rest House',
            'Compound',
            'Duplex',
            'Penthouse',
            'Studio',
            'Townhouse',
            'Farm',
            'Rest House',
            'Compound',
            'Duplex',
          ],
          title: 'Select Options',
        ),
      ),
    );
  }
}
