String categoriesWithProducts = """
{
  products {
    id,
    title,
    sku,
    description,
    stock,
    price,
    formatedPrice
  },
  categories {
    id,
    title,
    products {
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