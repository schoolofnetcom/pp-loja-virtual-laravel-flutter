import 'package:flutter/material.dart';

class ProductsImages extends StatefulWidget {
  List images = [];

  ProductsImages({Key key, this.images}) :super(key: key);
  @override
  _ProductsImagesState createState() => _ProductsImagesState();
}

class _ProductsImagesState extends State<ProductsImages> {
  @override
  Widget build(BuildContext context) {

    int length = 0;

    if (widget.images.length > 0) {
      length = widget.images.length;
    }
    
    Widget imagesWidget = Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          ),
        ),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (context, index) {
            return Image.network(widget.images[index]['url']);
          },
        )
      ],
    );

    if (length == 0) {
      imagesWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.image, color: Colors.grey),
          Text('Nenhuma imagem', style: TextStyle(color: Colors.grey),)
        ],
      );
    }

    return Container(
      width: double.infinity,
      height: 250.0,
      decoration: BoxDecoration(
        color: Colors.grey[300]
      ),
      child: imagesWidget
    );
  }
}