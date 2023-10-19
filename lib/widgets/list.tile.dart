import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final int position;
  final String title;
  final VoidCallback onEditClick;
  final VoidCallback onDeleteClick;
  const CustomListTile({super.key, required this.position, required this.title, required this.onEditClick, required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('Description $position'),
      leading: Text(position.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.green,),
            onPressed: onEditClick,
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red,),
            onPressed: onDeleteClick,
          ),
        ],
      )
    );
  }
}
