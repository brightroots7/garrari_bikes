import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/constants/customButton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_event.dart';
import '../../blocs/account/account_state.dart';
import '../../constants/Appcolors.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (_) => AccountBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Account',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                  ],
                ),
              ),


              _buildProfileTile(context),
              const SizedBox(height: 16),
              _buildOrdersTile(context),
              const SizedBox(height: 16),
              _buildNotificationTile(context),
              const SizedBox(height: 16),
              _buildaboutUSTile(context),
              const SizedBox(height: 16),
              _buildcontactUsTile(context),
              Spacer(),
              CustomButton(text: 'Logout ', onPressed: (){},fontSize:16,fontWeight:FontWeight.w500,backgroundColor: Colors.white,border: BorderSide(),textColor: Colors.black,width: width,),

              const SizedBox(height: 16),],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTile(BuildContext context) {
    return _buildContainer(
      child: Row(
        children: [
          Image.asset("assets/images/account.png",height: 17,),
          const SizedBox(width: 12),
           Text("Profile", style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500)),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersTile(BuildContext context) {
    return _buildContainer(
      child: Row(
        children: [
           Image.asset("assets/images/orders.png",height: 20,),
          const SizedBox(width: 12),
         Text("Orders", style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500)),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/orders');
            },
            child: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return _buildContainer(
          child: Row(
            children: [
              Image.asset("assets/images/notifications.png",height: 22,),
              const SizedBox(width: 12),
              Text("Notifications", style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500)),
              const Spacer(),
              Switch(
                value: state.isNotificationEnabled,
                onChanged: (value) {
                  context.read<AccountBloc>().add(ToggleNotification(value));
                },
                activeColor: Colors.black,
                activeTrackColor: Colors.black,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
                thumbColor: MaterialStateProperty.all(Appcolors.yellow2),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildaboutUSTile(BuildContext context) {
    return _buildContainer(
      child: Row(
        children: [
          Image.asset("assets/images/about_us.png",height: 17,),
          const SizedBox(width: 12),
          Text("About us", style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500)),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/aboutUs');
            },
            child: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildcontactUsTile(BuildContext context) {
    return _buildContainer(
      child: Row(
        children: [
          Image.asset("assets/images/contact_us.png",height: 17,),
          const SizedBox(width: 12),
          Text("Contact us", style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500)),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/contactUs');
            },
            child: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }
}
