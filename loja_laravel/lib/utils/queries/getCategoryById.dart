String getCategoryById = """
query getCategoryById(\$id: Int, \$page: Int){
  categories(id: \$id) {
    id,
    title,
    products(page: \$page) {
      total,
      to,
      current_page,
      data {
        id,
        title,
        sku,
        description,
        stock,
        price,
        formatedPrice
      }
    }
  }
}
""".replaceAll('\n', ' ');