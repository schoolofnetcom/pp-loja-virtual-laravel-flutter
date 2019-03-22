import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:loja_laravel/utils/queries/categoriesWithProducts.dart' as queries;
import 'package:loja_laravel/utils/data.dart';

class CategoriesQuery extends StatefulWidget {
  CategoriesQuery({Key key, this.builder}):super(key: key);

  final Function builder;

  @override
  _CategoriesQueryState createState() => _CategoriesQueryState();
}

class _CategoriesQueryState extends State<CategoriesQuery> {
  @override
  Widget build(BuildContext context) {
    return Query(
      queries.categoriesWithProducts,
      builder: ({bool loading, Map data, Exception error}) {
        return Builder(
          builder: (contex) {
            if (error != null) {
              return Text(error.toString());
            }

            if (loading) {
              return Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Carregando...'),
                    )
                  ],
                ),
              );
            }

            var graphqlData = new GraphQLData();
            graphqlData.data = data;

            return widget.builder(loading, data, error);
          },
        );
      },
    );
  }
}