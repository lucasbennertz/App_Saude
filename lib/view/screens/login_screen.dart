import 'package:flutter/material.dart';
import 'package:health_application/controller/logged_controller.dart';
import 'package:health_application/controller/regras_validacao_form.dart';
import 'package:health_application/model/user_model.dart';
import 'package:provider/provider.dart';
import '../../controller/mysql_database.dart';
import '../screens/main_page.dart';  // Aqui você importa a tela principal

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final RegrasValidacaoForm regras = RegrasValidacaoForm();
  bool userCadastro = false;
  MysqlDatabase database = MysqlDatabase();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    database.initDatabase();
  }

  // Função de cadastro de usuário
  Future<void> _cadastrarUsuario() async {
    final userProvider = Provider.of<UserModel>(context, listen: false);
    String email = _emailController.text;
    String senha = _passController.text;
    String nome = _nameController.text;
    String dataNasc = _birthController.text;

    bool usuarioExiste = await database.verificarSeTemUsuario(email);
    
    if (usuarioExiste) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuário já cadastrado!"), duration: Duration(seconds: 2))
      );
    } else {
      var newUser = UserModel.semId(nome, email, senha, dataNasc);
      await database.insertUser(newUser);
    
      // Atualiza o estado do Provider
      userProvider.nome = newUser.nome;
      userProvider.email = newUser.email;
      userProvider.senha = newUser.senha;
      userProvider.dataNasc = newUser.dataNasc;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cadastro realizado com sucesso!"), duration: Duration(seconds: 2))
      );

      setState(() {
        userCadastro = false;  // Retorna para a tela de login após o cadastro
      });
    }
  }

  // Função de login de usuário
  Future<void> _loginUsuario() async {
    final userProvider = Provider.of<UserModel>(context, listen: false);
    String email = _emailController.text;
    String senha = _passController.text;

    bool credenciaisCorretas = await database.verificarCredenciais(email, senha);

    if (credenciaisCorretas) {
      // Busca os dados completos do usuário no banco de dados
      UserModel? user = await database.buscarUsuarioPorEmail(email);

      if (user != null) {
        userProvider.nome = user.nome;
        userProvider.email = user.email;
        userProvider.senha = user.senha;
        userProvider.dataNasc = user.dataNasc;

        LoggedController.saveUser(user);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login bem-sucedido!"), duration: Duration(seconds: 2))
        );

        // Navega para a MainPage após o login bem-sucedido
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao recuperar dados do usuário."), duration: Duration(seconds: 2))
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email ou senha incorretos."), duration: Duration(seconds: 2))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7FB5AF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 120),
                Image.asset("assets/images/Instant_SOS.png", height: 230),
                SizedBox(height: 30),
                _buildTextField("Email", _emailController, validator: (value) => regras.validarEmail(value!)),
                SizedBox(height: 16),
                _buildTextField("Senha", _passController, obscureText: true, validator: (value) => regras.validarSenha(value!)),
                
                if (userCadastro) ...[
                  SizedBox(height: 16),
                  _buildTextField("Nome", _nameController, validator: (value) => regras.validarNome(value!),),
                  SizedBox(height: 16),
                  _buildTextField("Data de Nascimento", _birthController,validator: (value) => regras.validarDatanasc(value!)),
                ],
            
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (userCadastro) {
                      if(_formKey.currentState!.validate()){
                        await _cadastrarUsuario();
                      }   
                    } else {
                      await _loginUsuario();

                    }
                  },
                  child: Text(userCadastro ? "Cadastrar" : "Logar"),
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          userCadastro = !userCadastro; // Alterna entre login e cadastro
                        });
                      },
                      child: Text(userCadastro ? "Entrar em uma conta" : "Novo? Cadastre-se"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Adicionar funcionalidade de "Esqueci minha senha"
                      },
                      child: Text("Esqueci minha senha"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
  String label, 
  TextEditingController controller, 
  {bool obscureText = false, 
  String? Function(String?)? validator}) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xffd2d2e3),
      borderRadius: BorderRadius.circular(18),
    ),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,  
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
      ),
    ),
  );
}
}
