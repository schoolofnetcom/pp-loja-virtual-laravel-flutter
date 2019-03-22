class GraphQLData {
  static final GraphQLData _singleton = new GraphQLData._internal();

  factory GraphQLData() {
    return _singleton;
  }

  GraphQLData._internal();

  List _categories = [];
  int _categoryKey = 0;

  set data(data) {
    _categories = data["categories"];
  }

  set categoryId(String id) {

    var key =_categories.indexWhere((node) {
      return node['id'] == id;
    });

    if (key >= 0) {
      _categoryKey = key;
    } else {
      _categoryKey = 0;
    }
  }

  List get categories  => _categories;

  List get products {
    return _categories[_categoryKey]["products"]["data"];
  }

  Map get category {
    return _categories[_categoryKey];
  }
}
