import 'package:flutter/material.dart';
import 'package:health_application/model/user_model.dart';
import 'package:provider/provider.dart';

import '../components/my_app_bar.dart';
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "User"),
      body: Consumer<UserModel>(
        builder: (context, user, child) {
          return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  Column(
                    children: [
                      Text(user.nome)
                    ],
                  )
                ],
              ),
            ],
          ),
          );
        },
        
      ),
    );
  }
}
