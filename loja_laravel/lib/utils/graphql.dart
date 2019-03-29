import "package:flutter/material.dart";
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQL {
  static ValueNotifier<Client> client() {
    return ValueNotifier(
      Client(
        endPoint: 'https://159adc20.ngrok.io/graphql',
        cache: InMemoryCache()
      )
    );
  }
}