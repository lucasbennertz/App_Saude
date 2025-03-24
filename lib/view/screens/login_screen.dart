import 'package:flutter/material.dart';
import 'package:health_application/controller/regras_validacao_form.dart';
import 'package:health_application/model/user_model.dart';
import '../../controller/mysql_database.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  Future<void> _cadastrarUsuario() async {
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cadastro realizado com sucesso!"), duration: Duration(seconds: 2))
      );
      setState(() {
        userCadastro = false;
      });
    }
  }

  Future<void> _loginUsuario() async {
    String email = _emailController.text;
    String senha = _passController.text;

    bool credenciaisCorretas = await database.verificarCredenciais(email, senha);
    
    if (credenciaisCorretas) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login bem-sucedido!"), duration: Duration(seconds: 2))
      );
      // TODO: Navegar para a próxima tela
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 120),
              Image.asset("assets/images/Instant_SOS.png", height: 230),
              SizedBox(height: 30),
              _buildTextField("Email", _emailController),
              SizedBox(height: 16),
              _buildTextField("Senha", _passController, obscureText: true),
              
              if (userCadastro) ...[
                SizedBox(height: 16),
                _buildTextField("Nome", _nameController),
                SizedBox(height: 16),
                _buildTextField("Data de Nascimento", _birthController),
              ],

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (userCadastro) {
                    await _cadastrarUsuario();
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
                        userCadastro = !userCadastro;
                      });
                    },
                    child: Text(userCadastro ? "Entrar em uma conta" : "Novo? Cadastre-se"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Esqueci minha senha"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffd2d2e3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (value) => regras.validarUsuario(value!),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
