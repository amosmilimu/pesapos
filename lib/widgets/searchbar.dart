import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {

  final TextEditingController searchController;
  final String appBarTitle;
  final bool showScanButton;
  final VoidCallback? onExportClick;

  const CustomSearchBar(
      {super.key,
      required this.searchController,
      required this.appBarTitle,
      this.showScanButton = false,
      this.onExportClick});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {

  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _showSearch
          ? TextField(
        style: const TextStyle(color: Colors.white),
        controller: widget.searchController,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, color: Colors.white,),
            onPressed: () {
              setState(() {
                widget.searchController.clear();
                _showSearch = false;
              });
            },
          ),
        ),
      )
          : Text(widget.appBarTitle, style: const TextStyle(color: Colors.white),),
      actions: [
        if (!_showSearch)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _showSearch = true;
              });
            },
          ),
        //if (widget.showExportButton)
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'export_excel',
                child: Text('Export to Excel'),
              ),
              const PopupMenuItem(
                value: 'import_excel',
                child: Text('Import from Excel'),
              ),

              if (widget.showScanButton)
              const PopupMenuItem(
                value: 'scan_to_add',
                child: Text('Scan to Add'),
              ),
            ],
          )
      ],
    );
  }
}
