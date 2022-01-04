class CategoryModel {
  final int id;
  final String name;
  final bool isSelected;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.isSelected = false,
  });
}
