import "package:flutter/material.dart";
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQL {
  static ValueNotifier<Client> client() {
    return ValueNotifier(
      Client(
        endPoint: 'http://10.0.2.2:8000/graphql',
        cache: InMemoryCache()
      )
    );
  }
}