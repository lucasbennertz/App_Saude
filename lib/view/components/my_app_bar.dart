import 'package:flutter/material.dart';
import 'package:health_application/view/screens/caminho_class.dart';
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({super.key, required this.title});
  final String title;
  final CaminhoClass caminhos = CaminhoClass();
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
          Text(title, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),),
          InkWell(child: CircleAvatar(), onTap: () => Navigator.of(context).pushNamed(caminhos.TELA_LOGIN),),
        ],
      ),
      toolbarHeight: screenHeight * 0.10,
    );
  }
}
