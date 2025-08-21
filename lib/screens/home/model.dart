class Product {
  final String name;
  final String imageUrl;
  final double originalPrice;
  final double discountedPrice;
  final bool inStock;
  final double price;
  final double rating;
  final int reviewCount;
  final String category;

  Product({
    required this.name,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountedPrice,
    this.inStock = true,
    this.price = 6500,
    this.rating = 4.5,
    this.reviewCount = 11,
    this.category = 'Men',
  });
}
