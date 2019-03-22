import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/theme.dart';
import 'package:loja_laravel/widgets/products/list.dart';
import 'package:loja_laravel/widgets/products/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ThemeStore(
      title: 'Erik\'s Stores',
      builder: () {
        return Column(
          children: <Widget>[
            ProductsSearch(),
            ProductsList(
              title: 'Informática',
            )
          ],
        );
      },
    );
  }
}