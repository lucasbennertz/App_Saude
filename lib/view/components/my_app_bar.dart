import 'package:flutter/material.dart';
import 'package:health_application/model/user_model.dart';
import 'package:health_application/view/screens/caminho_class.dart';
import 'package:provider/provider.dart';
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({super.key, required this.title});
  final String title;
  final CaminhoClass caminhos = CaminhoClass();
  @override
  Size get preferredSize {
    return Size(double.infinity, 60);
  }
  verificarLogin(BuildContext context) {
        final userProvider = Provider.of<UserModel>(context, listen: false);
        if(userProvider.nome == ""){
          Navigator.of(context).pushNamed(caminhos.TELA_LOGIN);
        }
        else{
          WidgetsBinding.instance.addPostFrameCallback((_){
            Navigator.of(context).pushNamed(caminhos.TELA_USER_INFOS);
          });
        }
        print(userProvider.nome);
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
          InkWell(onTap: () => verificarLogin(context),child: CircleAvatar(),),
        ],
      ),
      toolbarHeight: screenHeight * 0.10,
    );
  }
}
