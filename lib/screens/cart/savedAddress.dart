import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/constants/customButton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/cart/cart_event.dart';
import '../../blocs/cart/cart_state.dart';


class SavedAddress extends StatelessWidget {
  const SavedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Addresses',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Column(
              children: [
                // Address List
                Expanded(
                  child: ListView.builder(
                    itemCount: state.addresses.length,
                    itemBuilder: (context, index) {
                      final address = state.addresses[index];
                      return GestureDetector(
                        onTap: () {
                          context.read<CartBloc>().add(SelectAddress(index));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: state.selectedAddressIndex == index
                                  ? Appcolors.yellow2
                                  : Colors.grey.shade300,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Radio<int>(
                                value: index,
                                groupValue: state.selectedAddressIndex,
                                onChanged: (value) {
                                  context.read<CartBloc>().add(SelectAddress(value!));
                                },
                                activeColor: Appcolors.yellow2,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      address['name'] ?? '',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      address['address'] ?? '',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Add Address Button
                DottedBorder(
                  options: RectDottedBorderOptions(
                    dashPattern: [4, 3],
                    strokeWidth: 2, color: Appcolors.yellow2,
                    padding: EdgeInsets.all(16),
                  ),


                  child: InkWell(
                    onTap: () {
                      // Mock: Add a new address (you can show a form instead)
                      context.read<CartBloc>().add(AddAddress({
                        'name': 'New User',
                        'address': 'New Address Line, City, Zip',
                      }));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Center(
                        child: Text(
                          "+ Add Address",
                          style: TextStyle(
                            fontSize: 16,
                            color: Appcolors.yellow2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Save Button
                CustomButton(
                  text: 'Save',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  textColor: Colors.white,
                  width: width,
                  borderRadius: 10,
                  backgroundColor: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
