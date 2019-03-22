import 'package:flutter/material.dart';
import 'package:loja_laravel/screens/product_screen.dart';

class ProductsList extends StatefulWidget {
  final String title;
  ProductsList({Key key, this.title}): super(key: key);
  
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.blueGrey,
          child: ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )
          ),
        ),
        Divider(color: Colors.transparent),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Column(
                children: <Widget>[
                  Image.network('https://picsum.photos/450/250?image=' + index.toString()),
                  ListTile(
                    title: Text('Produto ' + index.toString()),
                    subtitle: Text('R\$ 199,00'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen()
                  )
                );
              },
              onLongPress: () {
                print('fui tocado longamente');
              },
            );
          }
        )
      ],
    );
  }
}