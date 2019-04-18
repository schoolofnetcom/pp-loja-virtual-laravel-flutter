import 'package:flutter/material.dart';
import 'package:loja_laravel/widgets/theme/drawer.dart';
import 'package:loja_laravel/widgets/categories/query.dart';
import 'package:loja_laravel/screens/cart_screen.dart';

class ThemeStore extends StatefulWidget {
  final String title;
  final Function builder;
  final Function nextPage;
  
  ThemeStore({Key key, this.title, this.builder, this.nextPage}) : super(key: key);

  @override
  _ThemeStoreState createState() => _ThemeStoreState();
}

class _ThemeStoreState extends State<ThemeStore> {
  final ScrollController _scrollController = new ScrollController();
  
  bool _paginationLoading = false;

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
        CategoriesQuery(
          builder: (loading, data, error) {

            return Scaffold(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen()
                        )
                      );
                    },
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              drawer: ThemeDrawer(),
              body: NotificationListener(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    var bottomPosition = _scrollController.position.maxScrollExtent - _scrollController.offset;
                    if (bottomPosition <= 100 && !_paginationLoading) {
                      if (widget.nextPage != null) {
                        final callback = () async {
                          setState(() {
                            _paginationLoading = true;
                          });
                          await widget.nextPage();
                          setState(() {
                            _paginationLoading = false;
                          });
                        };
                        callback();
                      }
                    }
                  }
                },
                child:  SingleChildScrollView(
                  controller: _scrollController,
                  child: widget.builder(),
                ),
              )
            );
          },
        )
      ],
    );
  }
}