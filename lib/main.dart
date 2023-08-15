import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesapos/screens/tabs/pointofsale.dart';
import 'package:pesapos/screens/tabs/settings.dart';
import 'package:provider/provider.dart';
import 'screens/main/home.page.dart';
import 'themes/theme.provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),

        GetPage(
            name: '/settings',
            page: () => const SettingsPage(),
        ),

        GetPage(
            name: '/pos',
            page: () => PointOfSale(),
        )
      ],
    );
  }
}
