import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/products/search.dart';
import 'package:loja_laravel/utils/data.dart';

class ThemeDrawer extends StatefulWidget {
  @override
  _ThemeDrawerState createState() => _ThemeDrawerState();
}

class _ThemeDrawerState extends State<ThemeDrawer> {
  @override
  Widget build(BuildContext context) {
    var data = new GraphQLData();
    List categories = data.categories;

    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.red[300],
              Colors.blue[300]
            ]
          )
        ),
        child: Column(
          children: <Widget>[
            ProductsSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return ListTile(
                    title: Text(category['title']),
                    leading: Icon(Icons.label_important),
                    onTap: () {
                      data.categoryId = category['id'];
                      Navigator.pushNamed(context, '/');
                    },
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}