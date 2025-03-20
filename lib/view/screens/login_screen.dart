import 'package:flutter/material.dart';
import 'package:health_application/controller/regras_validacao_form.dart';
import 'package:health_application/model/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RegrasValidacaoForm regras = RegrasValidacaoForm();
  bool userCadastro = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _dataNascController = TextEditingController();
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
                  controller: _senhaController,
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
                      controller: _nomeController,
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
                      controller: _dataNascController,
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

              }, child: userCadastro ? Text("Cadastrar") : Text("Logar")),
  
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
