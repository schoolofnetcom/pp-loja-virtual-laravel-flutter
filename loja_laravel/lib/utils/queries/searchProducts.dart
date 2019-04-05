String searchProducts = """
query search(\$term: String) {
  products(term: \$term) {
    id,
    title,
    sku,
    description,
    stock,
    price,
    formatedPrice,
    images {
      url
    }
  }
}


""".replaceAll('\n', ' ');