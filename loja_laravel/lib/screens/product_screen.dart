import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/theme.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    Map _product = {
      "id": 1,
      "title": 'Notebook gamer',
      "sku": 'note-gamer',
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur erat sit amet lacus egestas mollis. Quisque mollis sed ligula in consectetur. Curabitur faucibus hendrerit turpis, at imperdiet velit pulvinar eu. Pellentesque gravida velit et lectus elementum, in semper metus mattis. Curabitur non massa eleifend metus vulputate pretium. Nullam volutpat non nunc vitae dictum. Morbi posuere, nulla a ultrices fringilla, massa odio gravida mi, nec commodo nisl magna non orci. Morbi tristique dui eget metus molestie, eu elementum nibh fringilla.",
      "stock": 10,
      "price": 3500,
      "formatedPrice": "R\$ 3.500,00"
    };
    
    return ThemeStore(
      title: _product["title"],
      builder: () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network('https://picsum.photos/450/250?image=50'),
            Divider(),
            ListTile(
              title: Text(_product["title"], style: Theme.of(context).textTheme.title,),
              subtitle: Row(
                children: <Widget>[
                  Icon(Icons.linear_scale, color: Colors.grey,),
                  Text(_product["formatedPrice"])
                ],
              ),
              trailing: FloatingActionButton(
                child: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  print('add to cart');
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Código: ' + _product["sku"], style: TextStyle(color: Colors.grey),),
                  Text(_product["description"]),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}