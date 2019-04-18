class GraphQLData {
  static final GraphQLData _singleton = new GraphQLData._internal();

  factory GraphQLData() {
    return _singleton;
  }

  GraphQLData._internal();

  List _categories = [];
  List _products = [];
  int _categoryKey = 0;
  int _categoryId = 0;

  set data(data) {
    _categories = data["categories"];
    _products = data["products"];
  }

  get categoryId => _categoryId;

  set categoryId(String id) {

    if (id == "0") {
      _categoryId = 0;
    } else {
      _categoryId = int.parse(id);
      var key =_categories.indexWhere((node) {
        return node['id'] == id;
      });

      if (key >= 0) {
        _categoryKey = key;
      } else {
        _categoryKey = null;
      }
    }
    
  }

  List get categories  => _categories;

  List get products {
    if (_categoryId == 0) {
      return _products;
    }
    return _categories[_categoryKey]["products"]["data"];
  }

  Map get category {
    return _categories[_categoryKey];
  }

  int get nextPage {
    final int currentPage = _categories[_categoryKey]['products']["current_page"];
    final int to = _categories[_categoryKey]['products']["to"];
    final int total = _categories[_categoryKey]['products']["total"];

    if (to == null && to > total) { // TODO: corrigir para if (to == null || to >= total) {
      return null;
    }

    return currentPage+1;
  }

  void productsAdd(Map data) {
    _categories[_categoryKey]['products']['data'] = _categories[_categoryKey]['products']['data'] + data["data"];
    _categories[_categoryKey]['products']['current_page'] = data["current_page"];
    _categories[_categoryKey]['products']['to'] = data["to"];
    _categories[_categoryKey]['products']['total'] = data["total"];
    _products = _products + data["data"];
  }
}
