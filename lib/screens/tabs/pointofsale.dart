import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:pesapos/screens/main/scanner.dart';
import '../../models/pos.item.dart';
import '../../widgets/product.tile.dart';

class PointOfSale extends StatefulWidget {

  const PointOfSale({Key? key}) : super(key: key);

  @override
  State<PointOfSale> createState() => _PointOfSaleState();
}

class _PointOfSaleState extends State<PointOfSale> {
  final List<PosItem> posItems = [
    PosItem('Item 1', 'Description 1', 20.0),
    PosItem('Item 1', 'Description 1', 20.0),
    PosItem('Item 2', 'Description 2', 15.0),
    PosItem('Item 3', 'Description 3', 10.0),
    // Add more POS items as needed
  ];

  late bool _showSearch = false;

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showSearch
            ? TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                  _showSearch = false;
                });
              },
            ),
          ),
        )
            : const Text('Point of Sale'),
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
          badge.Badge(
            position: badge.BadgePosition.topEnd(top: 0, end: 3),
            badgeContent: const Text("0"),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Handle cart icon press
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: posItems.length,
              itemBuilder: (context, index) {
                return PosItemWidget(posItems[index]);
              },
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Product Count: ${posItems.length}'),
                  Text('Total Amount: Ksh ${calculateTotalAmount().toStringAsFixed(2)}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle clear cart button press
                        },
                        child: const Text('Clear Cart'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle proceed to cart button press
                        },
                        child: const Text('Proceed to Cart'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ScannerPage(),
                            ),
                          );
                        },
                        child: const Text('Scan Products'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calculateTotalAmount() {
    double total = 0.0;
    for (var item in posItems) {
      total += item.price;
    }
    return total;
  }
}


