import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/products/list.dart';
import 'package:loja_laravel/widgets/theme.dart';

class SearchScreen extends StatefulWidget {
  final String term;
  SearchScreen({Key key, this.term}): super (key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ThemeStore(
      title: 'Resultado da busca',
      builder: () {
        return ProductsList(
          title: 'Buscando por ' + widget.term
        );
      }
    );
  }
}
