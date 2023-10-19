import 'package:flutter/material.dart';
import 'package:pesapos/widgets/home.tile.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final menuItems = [
    const HomeTile(
      title: 'Sales',
      key: ValueKey('Sales'),
      icon: Icons.monetization_on,
      color: Colors.deepPurple,
      textColor: Colors.white,
      route: '/sales',
    ),
    const HomeTile(
      key: ValueKey('Expenses'),
      title: 'Expenses',
      icon: Icons.money_off,
      color: Colors.deepOrange,
      textColor: Colors.white,
      route: '/expenses',
    ),
    const HomeTile(
      key: ValueKey('Inventory'),
      title: 'Inventory',
      icon: Icons.inventory,
      color: Colors.blueGrey,
      textColor: Colors.white,
      route: '/inventory',
    ),
    const HomeTile(
      key: ValueKey('Suppliers'),
      title: 'Suppliers',
      icon: Icons.supervisor_account,
      color: Colors.teal,
      textColor: Colors.white,
      route: '/suppliers',
    ),
    const HomeTile(
      key: ValueKey('Pos'),
      title: 'Point of Sale',
      icon: Icons.shopping_bag,
      color: Colors.redAccent,
      textColor: Colors.white,
      route: '/pos',
    ),
    const HomeTile(
      key: ValueKey('Customers'),
      title: 'Customers',
      icon: Icons.person,
      color: Colors.green,
      textColor: Colors.white,
      route: '/customers',
    ),
    const HomeTile(
      key: ValueKey('Reports'),
      title: 'Reports',
      icon: Icons.analytics,
      color: Colors.blue,
      textColor: Colors.white,
      route: '/reports',
    ),
    const HomeTile(
      key: ValueKey('Settings'),
      title: 'Settings',
      icon: Icons.settings,
      color: Colors.orange,
      textColor: Colors.white,
      route: '/settings',
    )
  ];
  final bool _isPinned = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: _isPinned,
            snap: false,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: _isPinned ? const EdgeInsets.only(left: 16,bottom: 16): EdgeInsets.zero,
              title: _isPinned ? const Align(
                alignment: Alignment.bottomCenter,
                  child: Text('Amos Ahindukha Cashier', textAlign: TextAlign.center,)
              ):null,
              background: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text(
                    'Pesapos',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ),

          ReorderableSliverGridView(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                final item = menuItems.removeAt(oldIndex);
                menuItems.insert(newIndex, item);
              });
            },
            childAspectRatio: 1.0,
            children: menuItems,
          )
        ],
      ),
    );
  }
}

