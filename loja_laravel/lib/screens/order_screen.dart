import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/theme.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return ThemeStore(
      title: 'Recebemos seu pedido',
      builder: () {
        return Card(
          child: Container(
            padding: EdgeInsets.all(60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.check_circle_outline, size: 80, color: Colors.green),
                Text(
                  'Pedido realizado',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 30),
                ),
                Text(
                  'Estamos processandos eu pedido, avisaremos por email da situação do seu pedido',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 20),
                )
              ],
            ),
          ),
        );
      } 
    );
  }
}