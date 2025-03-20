import 'package:flutter/material.dart';
import 'package:health_application/controller/regras_validacao_form.dart';
import 'package:health_application/model/user_model.dart';
import '../../controller/mysql_database.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RegrasValidacaoForm regras = RegrasValidacaoForm();
  bool userCadastro = false;
  MysqlDatabase database = MysqlDatabase();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _birthController = TextEditingController();
  @override
  void initState(){
    super.initState();
    database.initDatabase();
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
              SizedBox(height: 120,),
              Image.asset("assets/images/Instant_SOS.png", height: 230),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(color: Color(0xffd2d2e3), borderRadius: BorderRadius.circular(18)),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) => regras.validarUsuario(value!),
                  decoration: InputDecoration(
                    label: Text("Email"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(color: Color(0xffd2d2e3), borderRadius: BorderRadius.circular(18)),
                child: TextFormField(
                  controller: _passController,
                  validator: (value) => regras.validarUsuario(value!),
                  decoration: InputDecoration(
                      label: Text("Senha"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))
                  ),
                ),
              ),
              userCadastro ?
              Column(
                children: [
                  SizedBox(height: 16,),
                  Container(
                    decoration: BoxDecoration(color: Color(0xffd2d2e3), borderRadius: BorderRadius.circular(18)),
                    child: TextFormField(
                      controller: _nameController,
                      validator: (value) => regras.validarUsuario(value!),
                      decoration: InputDecoration(
                          label: Text("Nome"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    decoration: BoxDecoration(color: Color(0xffd2d2e3), borderRadius: BorderRadius.circular(18)),
                    child: TextFormField(
                      controller: _birthController,
                      validator: (value) => regras.validarUsuario(value!),
                      decoration: InputDecoration(
                          label: Text("Data de Nascimento"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))
                      ),
                    ),
                  ),
                ],
              ):Container(),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: (){
                var newUser = UserModel.semId(_nameController.text, _emailController.text, _passController.text, _birthController.text);
                database.insertUser(newUser);
              }, child: userCadastro ? Text("cadastrar") : Text("Logar")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                      userCadastro = !userCadastro;
                    });

                  }, child: Text(userCadastro ? "Entrar em uma conta" :"Novo? Cadastre-se")),
                  TextButton(onPressed: (){}, child: Text("Esqueci minha senha"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
