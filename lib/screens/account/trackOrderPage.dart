import 'package:flutter/material.dart';
import 'package:garraribikes/constants/customButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:garraribikes/constants/Appcolors.dart';

class TrackOrderPage extends StatelessWidget {
  final Map<String, dynamic> order;

  const TrackOrderPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(

      appBar: AppBar(
        title: Text("Track Order", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order tile
            Container(
              margin: const EdgeInsets.only(bottom: 16),
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
                      child: Image.asset(order["imageUrl"], width: 100, height: 100, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order["name"], style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 4),
                          Text("Order: #${order["orderNumber"]}", style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey)),
                          const SizedBox(height: 8),
                          Text(
                            order["status"] == "estimated"
                                ? "Estimated Delivery on ${order["date"]}"
                                : "Delivered on ${order["date"]}",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: order["status"] == "estimated" ? Appcolors.green : Appcolors.yellow2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Process Timeline',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildTimelineStage(
                    label: "Pending",
                    description: "Your order has been received and is being processed.",
                    date: "18 July 2025",
                    time: "10:00 PM",
                    color: Appcolors.yellow2,
                  ),
                  const SizedBox(height: 8),
                  _buildTimelineStage(
                    label: "Dispatched",
                    description: "Your bicycle has left the warehouse and is on its way.",
                    date: "18 July 2025",
                    time: "10:00 PM",
                    color: Appcolors.yellow2,
                  ),
                  const SizedBox(height: 8),
                  _buildTimelineStage(
                    label: "Delivered",
                    description: "Your order will be delivered soon.",
                    date: "18 July 2025",
                    time: "10:00 PM",
                    color: Appcolors.green,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _deliveryLocationWidget(
              context: context,
              customerName: "John Doe",
              address: "223, Mangarh, Machhiwara Road, Kohara, Ludhiana - 141112",
            ),

            const SizedBox(height: 20),

           CustomButton(text: 'Cancel Order', onPressed: (){},width: width,textColor: Colors.black,backgroundColor: Colors.white,border: BorderSide(),)

          ],
        ),
      ),
    );
  }

  Widget _buildTimelineStage({
    required String label,
    required String description,
    required String date,
    required String time,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.3),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(description, style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w400)),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Icon(Icons.calendar_today_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(date, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey,fontWeight: FontWeight.w500)),
                const SizedBox(width: 20),
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(time, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ],
      ),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Delivery Location',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: Colors.grey.shade200),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
                child: const Icon(Icons.location_on_outlined, color: Colors.black, size: 16),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(customerName, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18)),
                    const SizedBox(height: 4),
                    Text(address, style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey,fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
