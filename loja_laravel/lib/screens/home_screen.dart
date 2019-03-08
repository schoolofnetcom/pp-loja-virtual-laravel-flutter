import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            title: Text('Erik\'s Store'),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            textTheme: TextTheme(
              title: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.red[300],
                    Colors.blue[300]
                  ]
                )
              ),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Item " + index.toString()),
                    onTap: () {
                      print(index);
                    },
                  );
                },
              ),
            )
          ),
        )
      ],
    );
  }
}