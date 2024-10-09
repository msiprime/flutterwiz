import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String title;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.title = 'Select Items',
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final ValueNotifier<List<String>> _selectedItemsNotifier =
      ValueNotifier<List<String>>([]);

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (_) {
        return _BottomSheetContent(
          items: widget.items,
          selectedItemsNotifier: _selectedItemsNotifier,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showBottomSheet(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ValueListenableBuilder<List<String>>(
          valueListenable: _selectedItemsNotifier,
          builder: (context, selectedItems, _) {
            return Text(
              selectedItems.isEmpty ? widget.title : selectedItems.join(', '),
              style: TextStyle(fontSize: 16, color: Colors.black87),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _selectedItemsNotifier.dispose();
    super.dispose();
  }
}

class _BottomSheetContent extends StatelessWidget {
  final List<String> items;
  final ValueNotifier<List<String>> selectedItemsNotifier;

  const _BottomSheetContent({
    Key? key,
    required this.items,
    required this.selectedItemsNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: items.map((item) {
              return ValueListenableBuilder<List<String>>(
                valueListenable: selectedItemsNotifier,
                builder: (context, selectedItems, _) {
                  final isSelected = selectedItems.contains(item);
                  return ChoiceChip(
                    label: Text(item),
                    selected: isSelected,
                    onSelected: (_) {
                      if (isSelected) {
                        selectedItemsNotifier.value = List.from(selectedItems)
                          ..remove(item);
                      } else {
                        selectedItemsNotifier.value = List.from(selectedItems)
                          ..add(item);
                      }
                    },
                    selectedColor: Colors.blue.shade200,
                    backgroundColor: Colors.grey.shade200,
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              selectedItemsNotifier.value = [];
            },
            child: Text('Clear Selection'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: DropdownExample()));
}

class DropdownExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Dropdown Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomDropdown(
          items: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
          title: 'Select Options',
        ),
      ),
    );
  }
}
