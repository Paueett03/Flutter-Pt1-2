class Product {
  final String id;
  final String title;
  final String description;
  final String descriptionBreu; // Añadiendo este campo
  final double price;
  final String image;  // Este campo probablemente era 'image' en tu implementación anterior

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.descriptionBreu,
    required this.price,
    required this.image,
  });
}