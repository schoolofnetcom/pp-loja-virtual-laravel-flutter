import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/products/search.dart';

class ThemeDrawer extends StatefulWidget {
  @override
  _ThemeDrawerState createState() => _ThemeDrawerState();
}

class _ThemeDrawerState extends State<ThemeDrawer> {
  @override
  Widget build(BuildContext context) {
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
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Item " + index.toString()),
                    onTap: () {
                      print(index);
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