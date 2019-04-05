import "package:flutter/material.dart";
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQL {
  static ValueNotifier<Client> client() {
    return ValueNotifier(
      Client(
        endPoint: 'https://83a36a23.ngrok.io/graphql',
        cache: InMemoryCache()
      )
    );
  }
}