import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize {
    return Size(double.infinity, 60);
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the screen height dynamically here.
    final screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: const Color(0xFF7FB5AF),
      backgroundColor: const Color(0xFF7FB5AF),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/Instant_SOS.png", height: 55),
          Text(title),
          const CircleAvatar(),
        ],
      ),
      toolbarHeight: screenHeight * 0.10,
    );
  }
}
