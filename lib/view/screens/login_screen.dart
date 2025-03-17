import 'package:flutter/material.dart';
import 'package:health_application/controller/regras_validacao_form.dart';
import 'package:health_application/view/components/decoration/my_text_form_field_with_decoration_for_text.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RegrasValidacaoForm regras = RegrasValidacaoForm();
  TextEditingController _userController = TextEditingController();
  bool userCadastro = false;

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
                      validator: (value) => regras.validarUsuario(value!),
                      decoration: InputDecoration(
                          label: Text("Data de Nascimento"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))
                      ),
                    ),
                  ),
                ],
              ):Container(),

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
