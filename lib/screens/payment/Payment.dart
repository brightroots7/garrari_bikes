import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:garraribikes/constants/Appcolors.dart';

import '../../blocs/payment/payment_bloc.dart';
import '../../blocs/payment/payment_event.dart';
import '../../blocs/payment/payment_state.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text(
          'Payment',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => PaymentBloc(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Total Amount Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                decoration: _boxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Rs. 13,550',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Appcolors.yellow2,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Payment Options with BlocBuilder
              BlocBuilder<PaymentBloc, PaymentState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      _paymentOption(context, title: 'UPI', selected: state.selectedMethod),
                      const SizedBox(height: 12),
                      _paymentOption(context, title: 'Credit / Debit / ATM Card', selected: state.selectedMethod),
                      const SizedBox(height: 12),
                      _paymentOption(context, title: 'Net Banking', selected: state.selectedMethod),
                      const SizedBox(height: 12),
                      _paymentOption(context, title: 'Cash on Delivery', selected: state.selectedMethod),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentOption(BuildContext context, {
    required String title,
    required String selected,
  }) {
    final isSelected = title == selected;

    // Choose image asset path based on title
    String getPaymentIcon(String method) {
      switch (method) {
        case 'UPI':
          return 'assets/images/upi.png';
        case 'Credit / Debit / ATM Card':
          return 'assets/images/card.png';
        case 'Net Banking':
          return 'assets/images/netbanking.png';
        case 'Cash on Delivery':
          return 'assets/images/cod.png';
        default:
          return 'assets/icons/cod.png';
      }
    }

    return GestureDetector(
      onTap: () {
        context.read<PaymentBloc>().add(SelectPaymentMethod(title));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        width: double.infinity,
        decoration: _boxDecoration().copyWith(
          border: Border.all(
            color: isSelected ? Appcolors.yellow2 : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            // Payment Icon
            Image.asset(
              getPaymentIcon(title),
              height: 28,
              width: 28,
            ),
            const SizedBox(width: 12),

            // Title
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),

            Icon(Icons.keyboard_arrow_down, size: 24, color: Colors.black),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
      border: Border.all(color: Colors.grey.shade200),
    );
  }
}
