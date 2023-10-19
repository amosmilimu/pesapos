import 'package:flutter/material.dart';
import 'package:pesapos/widgets/list.tile.dart';
import 'package:pesapos/widgets/searchbar.dart';

class Suppliers extends StatefulWidget {
  const Suppliers({super.key});

  @override
  State<Suppliers> createState() => _SuppliersState();
}

class _SuppliersState extends State<Suppliers> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomSearchBar(
          searchController: _searchController,
          appBarTitle: 'Suppliers',
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
