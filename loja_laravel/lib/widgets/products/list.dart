import 'package:flutter/material.dart';
import 'package:loja_laravel/screens/product_screen.dart';
import 'package:loja_laravel/utils/data.dart';

class ProductsList extends StatefulWidget {
  ProductsList({Key key, this.title, this.products}): super(key: key);
  final String title;
  final List products;

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    var data = new GraphQLData();
    var products = data.products;
    var category = data.category;
    var title = category["title"];

    if (widget.title != null) {
      title = widget.title;
    }

    if (widget.products != null) {
      products = widget.products;
    }

    if (products.length == 0) {
      return Center(
        child: Card(
          color: Colors.orange,
          child: ListTile(
            leading: Icon(Icons.warning),
            title:Text('Nenhum produto encontrado')
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        Card(
          color: Colors.blueGrey,
          child: ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text(
                title,
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
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return GestureDetector(
              child: Column(
                children: <Widget>[
                  Image.network('https://picsum.photos/450/250?image=' + index.toString()),
                  ListTile(
                    title: Text(product["title"]),
                    subtitle: Text(product["formatedPrice"]),
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