import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/products/list.dart';
import 'package:loja_laravel/widgets/theme.dart';
import 'package:loja_laravel/utils/queries/searchProducts.dart' as query;
import 'package:graphql_flutter/graphql_flutter.dart';

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
      nextPage: () {
        print('carrega mais');
      },
      builder: () {
        return Query(
          query.searchProducts,
          variables: {
            'term': widget.term
          },
          builder: ({loading, data, error}) {
            if (loading) {
              return Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: CircularProgressIndicator(),
                    ),
                    ListTile(
                      title: Text('Buscando...'),
                    )
                  ],
                ),
              );
            }

            print(data);

            return ProductsList(
              title: "Resultados da busca por ${widget.term}",
              products: data["products"]
            );
          }
        );
      }
    );
  }
}
