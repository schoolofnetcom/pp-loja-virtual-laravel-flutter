import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/theme.dart';
import 'package:loja_laravel/screens/order_screen.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ThemeStore(
      title: 'Endereço',
      builder: () {
        return Card(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'CEP'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Rua'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Número'
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Este campo é obrigatório';
                            }
                          },
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Complemento'
                          ),
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bairro'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Cidade'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Estado'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text('Confirmar', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderScreen()
                          )
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}