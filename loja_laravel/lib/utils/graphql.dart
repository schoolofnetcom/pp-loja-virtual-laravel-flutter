import "package:flutter/material.dart";
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQL {
  static ValueNotifier<Client> client() {
    return ValueNotifier(
      Client(
        endPoint: 'https://2cfc2b98.ngrok.io/graphql',
        cache: InMemoryCache()
      )
    );
  }
}