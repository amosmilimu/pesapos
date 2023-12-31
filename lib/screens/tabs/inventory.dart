import 'package:flutter/material.dart';
import 'package:pesapos/widgets/list.tile.dart';
import 'package:pesapos/widgets/searchbar.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomSearchBar(
          searchController: _searchController,
          appBarTitle: 'Inventory',
          showScanButton: true,
          onExportClick: _exportToExcel,
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return CustomListTile(position: index, title: "title",
                  onEditClick: () {
                    print('Edit clicked');
                  },
                  onDeleteClick: () {
                    print('Delete clicked');
                  });
            }
        ),
      ),
    );
  }

  void _exportToExcel() {
    print('Export to Excel');
  }
}
