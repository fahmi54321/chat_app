import 'package:flutter/material.dart';

import 'package:chat_app/widgets/auth_form.dart';


class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: AuthForm(), //todo 1 (next auth_form)
    );
  }
}
