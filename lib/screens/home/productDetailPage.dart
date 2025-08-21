import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/constants/customButton.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colorOption.dart';
import 'model.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _currentImageIndex = 0;
  bool _isFavorite = false;
  Color selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    final width = MediaQuery.sizeOf(context).width;
    List<String> productImages = [
      'assets/images/men.png',
      'assets/images/women.png', // Example additional image
      'assets/images/kids.png',  // Example additional image
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image Container with Shadow
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Image Carousel
                    CarouselSlider(
                      items: productImages.map((image) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            image,
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 300,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() => _currentImageIndex = index);
                        },
                      ),
                    ),

                    // Like Button
                    Positioned(
                      top: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _isFavorite = !_isFavorite);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Icon(
                            _isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: _isFavorite ? Appcolors.yellow2 : Colors.grey,
                          ),
                        ),
                      ),
                    ),

                    // Image Position Dots
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: productImages.map((url) {
                          int index = productImages.indexOf(url);
                          return Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentImageIndex == index
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Product Name
              Text(
                widget.product.name,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              // Info Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Stock Status
                  _buildInfoContainer(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text( widget.product.inStock ? 'In Stock' : 'Out of Stock',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white)),
                    ),
                      widget.product.inStock ? Colors.green : Colors.red,),



                  // Star Rating
                  _buildInfoContainer(
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 24),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.product.rating} (${widget.product.reviewCount} reviews)',
                          style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),
                        ),
                      ],
                    ),
                    Colors.blue.shade50,
                  ),

                  // Category
                  _buildInfoContainer(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        widget.product.category,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,color: Colors.grey
                        ),
                      ),
                    ),
                    Colors.white,
                  ),

                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '₹${widget.product.discountedPrice.toStringAsFixed(0)}',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Appcolors.yellow2,
                    ),
                  ),
                  const SizedBox(width: 20), // Add spacing between the prices
                  Text(
                    '₹${widget.product.originalPrice.toStringAsFixed(0)}',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Color",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 16),
                  Row(
                    children: [
                      ColorOption(
                        color: Colors.red,
                        isSelected: selectedColor == Colors.red,
                        onTap: () {
                          setState(() {
                            selectedColor = Colors.red;
                          });
                        },
                      ),
                      ColorOption(
                        color: Colors.blue,
                        isSelected: selectedColor == Colors.blue,
                        onTap: () {
                          setState(() {
                            selectedColor = Colors.blue;
                          });
                        },
                      ),
                      ColorOption(
                        color: Colors.green,
                        isSelected: selectedColor == Colors.green,
                        onTap: () {
                          setState(() {
                            selectedColor = Colors.green;
                          });
                        },
                      ),
                      ColorOption(
                        color: Colors.orange,
                        isSelected: selectedColor == Colors.orange,
                        onTap: () {
                          setState(() {
                            selectedColor = Colors.orange;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              descriptionCardWidget(
                "Description",
                "26x300 branded tyre tube, steel ic frame, front shox, pu premium saddle, straight handle with attractive handle grips, alloy clutch, cwc44t bpc, jumbo crank, boot side stand, pvc mudguards, pvc chain cover, double disc brakes, bpc rims, bottle with holder.",
              ),
              SizedBox(height: height * 0.03),
              CustomButton(text: 'Add to cart', onPressed: (){},width: width,backgroundColor: Appcolors.yellow,textColor: Colors.black,fontSize: 18,fontWeight: FontWeight.w500,),

              SizedBox(height: height * 0.03),

            ],
          ),
        ),
      ),
    );
  }


  Widget _buildInfoContainer(Widget content, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: content,
    );
  }

  Widget descriptionCardWidget(String title, String description) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Appcolors.grey2,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }



}
