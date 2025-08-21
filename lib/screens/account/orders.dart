import 'package:flutter/material.dart';
import 'package:garraribikes/screens/account/trackOrderPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:garraribikes/constants/Appcolors.dart';

class Orders extends StatelessWidget {
  Orders({super.key});

  final List<Map<String, dynamic>> orders = [
    {
      "name": "Game Changer",
      "orderNumber": "545186",
      "imageUrl": "assets/images/men.png",
      "status": "estimated", // or "delivered"
      "date": "27 July",
    },
    {
      "name": "Sonpari",
      "orderNumber": "878754",
      "imageUrl": "assets/images/women.png",
      "status": "delivered",
      "date": "10 June",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("My Orders", style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final item = orders[index];
          return Container(
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
                  // Order Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item["imageUrl"],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Order Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name
                        Text(
                          item["name"],
                          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),

                        // Order Number
                        RichText(
                          text: TextSpan(
                            text: "Order: ",
                            style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                            children: [
                              TextSpan(
                                text: "#${item["orderNumber"]}",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Delivery Status
                        Text(
                          item["status"] == "estimated"
                              ? "Estimated Delivery on ${item["date"]}"
                              : "Delivered on ${item["date"]}",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: item["status"] == "estimated"
                                ? Appcolors.green
                                : Appcolors.yellow2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Trailing arrow
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TrackOrderPage(
                            order: item,
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
