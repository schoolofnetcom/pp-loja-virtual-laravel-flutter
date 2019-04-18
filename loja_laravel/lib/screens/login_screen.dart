import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/theme.dart';
import 'package:loja_laravel/screens/login/auth.dart';
import 'package:loja_laravel/screens/login/register.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ThemeStore(
      title: 'Identificação',
      builder: () {
        return Column(
          children: <Widget>[
            LoginAuth(),
            Divider(),
            LoginRegister()
          ],
        );
      },
    );
  }
}