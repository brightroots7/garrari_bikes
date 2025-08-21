import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "About us",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(

                "Garrari bikes seeks to offer you the finest and \nthe most economical bicycle enabled by our \nexpertise. Our aim is to deliver the most cost\neffective model based on your desired features \nto provide you the best value for money.\nWe believe that cycling is not just a \nsport or a mode of transportation, but a lifestyle.\nWe understand the importance of finding the right \nbike for your needs, whether it's for commuting,\nracing, or recreational riding. That's why we offer \na wide range of bicycles to suit all types of riders \nand budgets.\nIn addition to our products, we also provide \nhelpful resources and tips to help you get the \nmost out of your cycling experience. Our blog \nfeatures articles on topics such as bike \nmaintenance, cycling routes, and training tips \nfor different types of cycling events. We also \noffer personalized advice and support through \nour customer service team.\nWe pride ourselves on offering high-quality \nproducts at competitive prices, and we strive to \nmake the shopping experience as easy and \nconvenient as possible. Our website is easy to \nnavigate, and we offer fast and reliable shipping \noptions to ensure that you receive your \npurchases quickly.\nWe hope your relationship with your bicycle is \nthe most productive association.\nExperience the ride on wings of freedom with us.",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
