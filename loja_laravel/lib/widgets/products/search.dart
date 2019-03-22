import 'package:flutter/material.dart';
import 'package:loja_laravel/screens/search_screen.dart';

class ProductsSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          labelText: 'Pesquisar',
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.search)
        ),
        onSubmitted: (value) {
          if (value.length == 0) {
            return;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(term: value)
            )
          );
        },
      ),
    );
  }
}