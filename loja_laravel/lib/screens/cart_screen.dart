import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/theme.dart';
import 'package:loja_laravel/screens/login_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ThemeStore(
      title: 'Finalização de pedido',
      builder: () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                title: Text(
                  'Carrinho de compras',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                int i = index + 1;
                return this.product(i);
              },
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                color: Colors.blue,
                child: Text('Finalizar pedido', style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen()
                    )
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }

  Widget product(i) {
    return Card(
      child: ListTile(
        title: Text('Produto ' + i.toString()),
        subtitle: Text('R\$ 100.00'),
        trailing: Ink(
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.red[200],
          ),
          child: IconButton(
            icon: Icon(Icons.remove, color: Colors.white,),
            tooltip: 'Remove o produto do carrinho',
            onPressed: () {
              print(i);
            },
          ),
        ),
      ),
    );
  }
}