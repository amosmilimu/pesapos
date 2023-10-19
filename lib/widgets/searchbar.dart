import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {

  final TextEditingController searchController;
  final String appBarTitle;
  final bool showExportButton;
  final VoidCallback? onExportClick;

  const CustomSearchBar(
      {super.key,
      required this.searchController,
      required this.appBarTitle,
      this.showExportButton = false,
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
        if (widget.showExportButton)
          IconButton(
            icon: const Icon(Icons.cloud_download, color: Colors.white,),
            onPressed: widget.onExportClick,
          ),
      ],
    );
  }
}
