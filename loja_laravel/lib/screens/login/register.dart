import 'package:flutter/material.dart';
import 'package:loja_laravel/screens/address_screen.dart';

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Novo usuário'),
          ),
          Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Nome é obrigatório';
                      }
                      RegExp regExp = new RegExp(
                        '^[A-Z][a-z]+(\ [A-Z][a-z]+)+\$',
                        caseSensitive: true,
                        multiLine: false
                      );

                      if (!regExp.hasMatch(value)) {
                        return 'O nome precisa ser válido';
                      }
                    },
                  ),
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'DDD'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'DDD é obrigatório';
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Telefone'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Telefone é obrigatório';
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
                    child: Text('Cadastrar', style: TextStyle(color: Colors.white),),
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