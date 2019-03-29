import 'package:flutter/material.dart';
import 'package:loja_laravel/utils/data.dart';
import 'package:loja_laravel/widgets/theme.dart';
import 'package:loja_laravel/widgets/products/list.dart';
import 'package:loja_laravel/widgets/products/search.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:loja_laravel/utils/graphql.dart';
import 'package:loja_laravel/utils/queries/getCategoryById.dart' as query;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var data = new GraphQLData();

    return ThemeStore(
      title: 'Erik\'s Stores',
      nextPage: () {
        if (data.categoryId != 0 && data.nextPage != null) {
          final Client client = GraphQL.client().value;
          return client.query(
            query: query.getCategoryById,
            variables: {
              "id": data.categoryId,
              "page": data.nextPage
            }
          ).then((result) {
            setState(() {
             data.productsAdd(result["categories"][0]["products"]); 
            });
          });
        }
      },
      builder: () {
        if (data.categoryId == 0) {
          return Column(
            children: <Widget>[
              ProductsSearch(),
              ProductsList(
                title: 'Produtos em destaque',
              )
            ],
          );
        }

        return Column(
          children: <Widget>[
            ProductsSearch(),
            ProductsList()
          ],
        );
        
      },
    );
  }
}