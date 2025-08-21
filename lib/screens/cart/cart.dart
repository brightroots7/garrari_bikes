import 'package:flutter/material.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/constants/customButton.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_model.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  final List<CartItem> items = [
    CartItem(
      name: 'Game Changer',
      imageUrl: 'assets/images/men.png',
      price: 6550.0,
      quantity: 1,
    ),
    CartItem(
      name: 'Sonpari',
      imageUrl: 'assets/images/women.png',
      price: 8000.0,
      quantity: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Cart",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${_totalItemCount()} items ',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Appcolors.grey,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Cart Items
              ...items.map(
                (item) => Dismissible(
                  key: Key(item.name),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,

                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (_) async {
                    return await showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Delete ${item.name}?"),
                        content: Text(
                          "Are you sure you want to remove this item from the cart?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: Text("Delete"),
                          ),
                        ],
                      ),
                    );
                  },
                  onDismissed: (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} deleted')),
                    );
                  },
                  child: Container(
                    // height: height * 0.13,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 3, color: Colors.black12),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            height: height * 0.1,
                            width: width * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(blurRadius: 3, color: Colors.black12),
                              ],
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              item.imageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.name,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade50,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          _circleButton(Icons.remove),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            child: Text(
                                              '${item.quantity}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          _circleButton(Icons.add),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            'Rs. ${(item.price * item.quantity).toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Appcolors.yellow2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              _deliveryLocationWidget(context: context,
                customerName: 'John Doe',
                address:
                    'House 1920, Sector-15, Panchkula, Haryana, Pin- 1601662',
              ),
              SizedBox(height: height * 0.02),
              _cartTotal(subTotal: '6800', gst: '0', Total: '6800'),
              SizedBox(height: height * 0.02),
              CustomButton(text: 'Checkout', onPressed: (){   Navigator.pushNamed(context, '/payment');
              },fontSize: 18,fontWeight: FontWeight.w500,backgroundColor: Appcolors.yellow,textColor: Colors.black,borderRadius: 10,width: width,),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  int _totalItemCount() {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  Widget _circleButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      padding: EdgeInsets.all(4),
      child: Icon(icon, size: 12),
    );
  }

  Widget _deliveryLocationWidget({
    required BuildContext context,
    required String customerName,
    required String address,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black12)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Location',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/savedAddress');

                }, child: Text(
                'Change',
                style: GoogleFonts.poppins(
                fontSize: 16,
                color: Appcolors.yellow2,
                fontWeight: FontWeight.w400,
                ),
      ),

                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(color: Colors.grey.shade200),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customerName,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        address,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartTotal({
    required String subTotal,
    required String gst,
    required String Total,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black12)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cart Total",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(color: Colors.grey.shade200),
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,

                  ),
                ),
                Text(
                  'Rs ${subTotal}',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,color: Colors.grey

                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "GST",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,

                  ),
                ),
                Text(
                  'Rs ${gst}',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,color: Colors.grey

                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Total",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,

                  ),
                ),
                Text(
                  'Rs ${Total}',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
