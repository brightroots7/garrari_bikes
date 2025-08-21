import 'package:flutter/material.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite extends StatelessWidget {
  Favourite({super.key});

  final List<Map<String, dynamic>> favourites = [
    {
      "name": "Game Changer",
      "price": 6550.0,
      "imageUrl": "assets/images/men.png",
      "inStock": true,
    },
    {
      "name": "Sonpari",
      "price": 8000.0,
      "imageUrl": "assets/images/women.png",
      "inStock": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text("Favourites", style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          final item = favourites[index];
          return Dismissible(
            key: Key(item["name"]),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (_) async {
              return await showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Remove ${item["name"]}?"),
                  content: const Text("Are you sure you want to remove this item from your favourites?"),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancel")),
                    TextButton(onPressed: () => Navigator.pop(context, true), child: const Text("Remove")),
                  ],
                ),
              );
            },
            onDismissed: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item["name"]} removed from favourites")),
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
                        item["imageUrl"],
                        width: 120,
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
                            item["name"],
                            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Rs. ${item["price"].toStringAsFixed(2)}",
                            style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: Appcolors.yellow2),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: item["inStock"] ? Appcolors.green : Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                item["inStock"] ? "In Stock" : "Out of Stock",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
