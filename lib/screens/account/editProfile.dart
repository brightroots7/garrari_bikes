import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/constants/customButton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_event.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<AccountBloc>().state;
    _nameController.text = state.name;
    _phoneController.text = state.phone;
    _emailController.text = state.email;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text("Edit Profile",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(

          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/profile.png'), // Replace this
                    backgroundColor: Colors.grey[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildEditableTextField(controller: _nameController, label: "Name"),
              const SizedBox(height: 16),
              _buildEditableTextField(controller: _phoneController, label: "Phone Number"),
              const SizedBox(height: 16),
              _buildEditableTextField(controller: _emailController, label: "Email"),
              SizedBox(height: height*0.27),
              CustomButton(text: 'Save',fontWeight: FontWeight.w500,fontSize: 18,borderRadius: 12,width: width, backgroundColor:Appcolors.yellow,textColor:Colors.black,onPressed: (){ context.read<AccountBloc>().add(UpdateProfile(
                name: _nameController.text,
                phone: _phoneController.text,
                email: _emailController.text,
              ));
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => _buildSuccessDialog(context),
              );

              }),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6),
        Material(

          borderRadius: BorderRadius.circular(12),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(

              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder( borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessDialog(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green.shade100,
              child: Icon(Icons.check_circle, size: 64, color: Colors.green),
            ),
            const SizedBox(height: 24),


            Text(
              "Profile Updated Successfully",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),


            Text(
              "Your profile details have been successfully updated.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),


            SizedBox(
              width: width,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.yellow,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.arrow_back),
                label: Text(
                  "Back to Home",
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
