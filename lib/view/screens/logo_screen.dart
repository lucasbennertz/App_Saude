import 'package:flutter/material.dart';
import 'package:health_application/controller/logged_controller.dart';
import 'package:health_application/model/user_model.dart';
import 'package:health_application/view/screens/caminho_class.dart';
import 'package:provider/provider.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  final CaminhoClass tela = CaminhoClass();

  @override
  void initState() {
    super.initState();
    // Chama a verificação de login e atualização do provider apenas uma vez ao inicializar a tela
    checkLoginStatus();
  }

  // Função para verificar se o usuário está logado e atualizar o Provider
  Future<void> checkLoginStatus() async {
    // Recupera os dados do usuário
    UserModel? user = await LoggedController.getUser();

    // Verifica se o widget ainda está montado (para evitar erros de navegação)
    if (!mounted) return;

    final userProvider = Provider.of<UserModel>(context, listen: false);

    if (user != null) {
      // Atualiza os dados do usuário no provider
      userProvider.atualizarUsuario(
        novoNome: user.nome,
        novoEmail: user.email,
        novaSenha: user.senha,
        novaDataNasc: user.dataNasc,
      );

      // Redireciona para a tela inicial
      Navigator.pushReplacementNamed(context, tela.TELA_INICIAL);
    } else {
      // Redireciona para a tela de login se o usuário não estiver logado
      Navigator.pushReplacementNamed(context, tela.TELA_LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF7FB5AF),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/Instant_SOS.png"),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(), // Indicador de carregamento enquanto verifica login
          ],
        ),
      ),
    );
  }
}
