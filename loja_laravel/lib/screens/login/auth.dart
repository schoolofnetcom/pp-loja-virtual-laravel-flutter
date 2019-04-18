import 'package:flutter/material.dart';
import 'package:loja_laravel/screens/address_screen.dart';

class LoginAuth extends StatefulWidget {
  @override
  _LoginAuthState createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Autenticação'),
          ),
          Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email é obrigatório';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha'
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Senha é obrigatória';
                      }
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text('Acessar', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressScreen()
                          )
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}