import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/constants/customButton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/payment/payment_bloc.dart';
import '../../blocs/payment/payment_event.dart';
import '../../blocs/payment/payment_state.dart';
import 'orderItemModel.dart';

class Ordersuccess extends StatelessWidget {
  const Ordersuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderSuccessBloc()..add(LoadOrderSuccess()),
      child: Scaffold(
        body: BlocBuilder<OrderSuccessBloc, OrderSuccessState>(
          builder: (context, state) {
            if (state is OrderSuccessLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrderSuccessLoaded) {
              return _buildSuccessScreen(context, state);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildSuccessScreen(BuildContext context, OrderSuccessLoaded state) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: height * 0.3,
            decoration: BoxDecoration(
              color: Appcolors.green,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Order Confirmed',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Thank you for shopping with us',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ID: ${state.orderId}',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Delivery Estimate Container
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset('assets/images/truck.png', width: 35, height: 35),
                const SizedBox(width: 15),
                Text(
                  'Estimate delivery by ${state.deliveryDate}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: state.items.map((item) => _buildOrderItem(item, height, width)).toList(),
            ),
          ),

          _deliveryWidget(context: context, customerName: 'John Marks', address: 'House 1920, Sector-15, Panchkula, Haryana, Pin- 1601662'),

          _paymentMethodWidget(
            methodName: 'Credit / Debit Card',
            methodNumber: '**** **** **** 1234',
            imageAsset: 'assets/images/card.png',
          ),
          SizedBox(height: height*0.01,),
          Padding(
          padding: const EdgeInsets.all(12),
          child: CustomButton(width:width,text: 'Continue Shopping',borderRadius: 10, onPressed: (){},backgroundColor: Appcolors.yellow,fontSize: 18,fontWeight: FontWeight.w500,textColor: Colors.black,),
        ),
          SizedBox(height: height*0.02,),
        ],
      ),
    );
  }


  Widget _deliveryWidget({
    required BuildContext context,
    required String customerName,
    required String address,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black12)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery Location',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
      ),
    );
  }
  Widget _buildOrderItem(OrderItem item, double height, double width) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black12,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: height * 0.1,
            width: width * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.black12,
                ),
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
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Qty: ${item.quantity}',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rs. ${(item.price * item.quantity).toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Appcolors.yellow2,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }



  Widget _paymentMethodWidget({
    required String methodName,
    required String methodNumber,
    required String imageAsset,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black12,
                  offset: Offset(0, 2),
                ),
              ],
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Payment Icon
                    Image.asset(
                      imageAsset,
                      height: 30,
                      width: 30,
                      fit: BoxFit.contain,
                    ),



                          Text(
                            methodName,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            methodNumber,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey,
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