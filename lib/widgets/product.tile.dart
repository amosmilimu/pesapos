import 'package:flutter/material.dart';

import '../models/pos.item.dart';

class PosItemWidget extends StatelessWidget {
  final PosItem posItem;

  const PosItemWidget(this.posItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.shopping_cart, size: 50),
              ),
            ),
          ),
          Padding(
            padding:const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  posItem.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(posItem.description),
                const SizedBox(height: 8),
                Text(
                  'Ksh. ${posItem.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}