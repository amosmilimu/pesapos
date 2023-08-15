import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTile extends StatelessWidget {

  final String title;
  final IconData icon;
  final Color? color;
  final Color? textColor;
  final String route;

  const HomeTile(
      {super.key,
      required this.title,
      required this.icon,
      this.color,
      this.textColor, required this.route,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Card(
            color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: textColor,
              ),
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ]
          )
        ),
        onTap: () {
          Get.toNamed(route);
        },
      )
    );
  }
}
