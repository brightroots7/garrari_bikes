import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:garraribikes/constants/Appcolors.dart';

import '../home/model.dart';
import '../home/productDetailPage.dart';

class CategoryItemsPage extends StatefulWidget {
  final String categoryName;

  const CategoryItemsPage({super.key, required this.categoryName});

  @override
  State<CategoryItemsPage> createState() => _CategoryItemsPageState();
}

class _CategoryItemsPageState extends State<CategoryItemsPage> {
  List<Product> categoryItems = [
    Product(
      name: "Game Changer",
      price: 6550.0,
      imageUrl: "assets/images/men.png",
      inStock: true,
      rating: 4.5,
      reviewCount: 120,
      category: "Men",
      originalPrice: 8000,
      discountedPrice: 6550,
    ),
    Product(
      name: "Sonpari",
      price: 8000.0,
      imageUrl: "assets/images/women.png",
      inStock: false,
      rating: 4.2,
      reviewCount: 80,
      category: "Women",
      originalPrice: 9000,
      discountedPrice: 8000,
    ),
  ];

  // Track liked states
  final Map<int, bool> likedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${widget.categoryName} Items",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          final product = categoryItems[index];
          final isLiked = likedItems[index] ?? false;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        product.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Rs. ${product.price.toStringAsFixed(2)}",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Appcolors.yellow2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: product.inStock ? Appcolors.green : Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              product.inStock ? "In Stock" : "Out of Stock",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Trailing Like Button
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Appcolors.yellow : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          likedItems[index] = !isLiked;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
