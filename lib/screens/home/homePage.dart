import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/blocs/home/home_bloc.dart';
import 'package:garraribikes/blocs/home/home_event.dart';
import 'package:garraribikes/blocs/home/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/screens/home/productDetailPage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().add(LoadCarousel());
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: 'SpeedX Falcon',
        imageUrl: 'assets/images/men.png',
        originalPrice: 40000,
        discountedPrice: 32999,
      ),
      Product(
        name: 'Xtreme Turbo',
        imageUrl: 'assets/images/women.png',
        originalPrice: 45000,
        discountedPrice: 37999,
      ),
      Product(
        name: 'Urban Glide',
        imageUrl: 'assets/images/kids.png',
        originalPrice: 38000,
        discountedPrice: 29999,
      ),
    ];
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,

      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Greeting Text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Appcolors.grey,
                              ),
                            ),
                            Text(
                              "Welcome",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Appcolors.appColor,
                              ),
                            ),
                          ],
                        ),


                        IconButton(
                          onPressed: () {
                           Navigator.pushNamed(context, '/notification');
                          },
                          icon: Icon(Icons.notifications, color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Appcolors.appColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,color: Colors.black26
                                    )]
                                ),
                                child: Icon(Icons.chevron_right,color: Colors.black,size: 24,),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.02),

                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildCategoryItem(
                            "All",
                            "assets/images/all.png",
                            imageSize: 30,
                          ),
                          _buildCategoryItem(
                            "Men",
                            "assets/images/men.png",
                            imageSize: 60,
                          ),
                          _buildCategoryItem(
                            "Women",
                            "assets/images/women.png",
                            imageSize: 60,
                          ),
                          _buildCategoryItem(
                            "Kids",
                            "assets/images/kids.png",
                            imageSize: 60,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  if (state.carouselItems.isNotEmpty)
                    Column(
                      children: [
                        CarouselSlider(
                          items: state.carouselItems.map((url) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                url,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            // autoPlay: true,
                            aspectRatio: 27 / 12,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {},
                          ),
                        ),

                        // Carousel Indicator (simple dot-style)
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            state.carouselItems.length,
                            (index) => Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Featured Products',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Appcolors.appColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [BoxShadow(
                                        blurRadius: 2,color: Colors.black26
                                    )]
                                ),
                                child: Icon(Icons.chevron_right,color: Colors.black,size: 24,),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return _buildProductCard(products[index]);
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Best Seller',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Appcolors.appColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [BoxShadow(
                                    blurRadius: 2,color: Colors.black26
                                  )]
                                ),
                                child: Icon(Icons.chevron_right,color: Colors.black,size: 24,),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return _buildProductCard(products[index]);
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem(
    String title,
    String assetPath, {
    double imageSize = 30,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Image.asset(
                assetPath,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Add this to remove extra space
            children: [
              // Image container
              Container(
                height: 160, // Increased height
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    blurRadius: 2,color: Colors.black26
                  )],
                  borderRadius: const BorderRadius.all(Radius.circular(12),
                  ),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        product.imageUrl,
                        height: 160, // Match container height
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: StatefulBuilder(
                        builder: (context, setHeartState) {
                          bool isFav = false;
                          return GestureDetector(
                            onTap: () {
                              setHeartState(() => isFav = !isFav);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.black26, blurRadius: 4)
                                ],
                              ),
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav ? Appcolors.yellow : Colors.grey,
                                size: 18,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Text content
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Add this
                  children: [
                    // Model Name
                    Text(
                      product.name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹${product.discountedPrice.toStringAsFixed(0)}',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Appcolors.yellow2,
                          ),
                        ),
                        Text(
                          '₹${product.originalPrice.toStringAsFixed(0)}',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}
