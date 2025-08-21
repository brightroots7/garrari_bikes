import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/constants/customButton.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/contactus/contactus_bloc.dart';
import '../../blocs/contactus/contactus_event.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => ContactUsBloc(),
      child: Scaffold(
        appBar: AppBar(backgroundColor:Colors.white,title: Text("Contact Us",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500)),centerTitle: true,),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Need Help? We’re Here \nFor You!",

                  style: GoogleFonts.poppins(
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                _buildInfoContainer(
                  icon: Icons.location_on,
                  title: "Address",
                  subtitle: "223, Mangarh, Machhiwara Road,\nKohara, Ludhiana - 141112",
                ),
                _buildInfoContainer(
                  icon: Icons.call,
                  title: "Call Us",
                  subtitle: "+91-9910882836",
                ),
                _buildInfoContainer(
                  icon: Icons.email,
                  title: "Email Us",
                  subtitle: "customercare@garraribikes.com",
                ),
                const SizedBox(height: 30),
                const Text(
                  "Get in touch!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                _buildTextField(label: "Name"),
                _buildTextField(label: "Email"),
                _buildTextField(label: "Phone number"),
                _buildTextField(label: "Subject"),
                _buildTextField(
                  label: "Type your message",
                  maxLines: 6,
                ),
                const SizedBox(height: 30),
                CustomButton(
                    borderRadius: 10,
                    width:width,backgroundColor:Appcolors.yellow,textColor:Colors.black,fontSize:18,fontWeight:FontWeight.w500,text: 'Save', onPressed: (){context.read<ContactUsBloc>().add(SubmitContactForm());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Form submitted')),
                );}),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContainer({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Appcolors.yellow2.withOpacity(0.04),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Appcolors.yellow2.withOpacity(0.3),
                  blurRadius: 2,
                  spreadRadius: 2,

                ),
              ],
            ),
            child: Icon(icon, size: 17, color: Appcolors.yellow2),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                  GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTextField({required String label, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
