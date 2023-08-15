import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../themes/theme.provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeProvider.toggleTheme();
          },
          child: const Text('Toggle Theme'),
        ),
      ),
    );
  }
}
