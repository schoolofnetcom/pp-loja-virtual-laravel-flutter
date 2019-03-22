import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/theme/drawer.dart';

class ThemeStore extends StatefulWidget {
  final String title;
  final Function builder;
  
  ThemeStore({Key key, this.title, this.builder}) : super(key: key);

  @override
  _ThemeStoreState createState() => _ThemeStoreState();
}

class _ThemeStoreState extends State<ThemeStore> {
  final ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image:DecorationImage(
              image:AssetImage('assets/background.png'),
              alignment: Alignment(0, -1)
            )
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            textTheme: TextTheme(
              title: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  print('open cart');
                },
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          drawer: ThemeDrawer(),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: widget.builder(),
          )
        )
      ],
    );
  }
}