import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/theme.dart';
import 'package:loja_laravel/widgets/products/images.dart';

class ProductScreen extends StatefulWidget {
  Map product = {};
  ProductScreen({Key key, this.product}) :super(key:key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    Map _product = widget.product;
    
    return ThemeStore(
      title: _product["title"],
      builder: () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductsImages(images: _product["images"]),
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