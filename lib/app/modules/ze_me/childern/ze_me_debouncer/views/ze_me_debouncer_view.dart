import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../data/utils/debounce_until.dart';
import '../controllers/ze_me_debouncer_controller.dart';

class ZeMeDebouncerView extends StatefulWidget {
  const ZeMeDebouncerView({super.key});

  @override
  State<ZeMeDebouncerView> createState() => _ZeMeDebouncerViewState();
}

class _ZeMeDebouncerViewState extends State<ZeMeDebouncerView> {
  final controller = Get.put(ZeMeDebouncerController());

  final Debouncer _debouncer = Debouncer(delay: const Duration(milliseconds: 500));
  final List<String> _allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  void _onSearchChanged(String query) {
    _debouncer.run(() {
      setState(() {
        _filteredItems = _allItems
            .where((item) => item.toLowerCase().contains(
                  query.toLowerCase(),
                ))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _debouncer.dispose();
    Get.delete<ZeMeDebouncerController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search with Debounce')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: _onSearchChanged,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
