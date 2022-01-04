class ProductModel {
  final int id;
  final String name;
  final String image;
  final String category;
  final double price;
  final bool isFav;
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    this.isFav = false,
  });
}
