import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TrackingOverViewDetail extends StatelessWidget {
  const TrackingOverViewDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Icon(Iconsax.arrow_left),
        ),
        centerTitle: true,
        title: const Text(
          "A1Y8728",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0xff101828),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: Column(
            children: [
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                child:  const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailText(label: "Date Created",text: 'Monday, 17 Oct. 2023',),
                          DetailText(label: "Sender",text: 'GIFT JONAS',),
                          SizedBox(),
                        ],
                      ),
                      SizedBox(height: 20,),
                      DetailText(label: "Pickup Location", text: "40 Kwari street, Karu, Abuja, Nigeria 90001"),
                      SizedBox(height: 25,),
                      Text("Shipment Specifications",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff101828),
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailText(label: "Delivery Type",text: 'Express',),
                          DetailText(label: "Shipment Location",text: 'Intra City',),
                          DetailText(label: "Destination Preference",text: 'Multiple Destination',),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          DetailText(label: "Trip type",text: 'One way',),
                          SizedBox(width: 15,),
                          DetailText(label: "Pickup type",text: 'Instant',),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Text("Delivery Destination",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff101828),
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 15,),
                      DeliveryDestination(),
                      DeliveryDestination(),
                      DeliveryDestination(),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(child: Container(
                      height: 57,
                      decoration: BoxDecoration(
                        color: Color(0xffFBEAE1),
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Center(
                        child: Text("Print Label",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff101828),
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(width: 20,),
                    Expanded(child: Container(
                      height: 57,
                      decoration: BoxDecoration(
                        color: Color(0xffF26520),
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Center(
                        child: Text("Live Tracking",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryDestination extends StatelessWidget {
  const DeliveryDestination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DetailText(label: "Shipping to", text: "Joseph Jones"),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              decoration: BoxDecoration(
                  color: const Color(0xffECFDF3),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: const Row(
                children: [
                  CircleAvatar(radius: 3,
                  backgroundColor:  Color(0xff027A48),),
                  SizedBox(width: 5,),
                  Text("Paid",
                  style: TextStyle(
                    fontSize: 12,color: Color(0xff027A48)
                  ),
                  ),
                ],
              ),
            ),
          ],

        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '23 Chicago street, Gwarinpa, Abuja',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff344054),
              ),
            ),
            Text(
              'View Package',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffF26520),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff667085),
            )
          ],
        ),
        const SizedBox(height: 10,),
        const Divider(),
        const SizedBox(height: 20,),

      ],
    );
  }
}

class DetailText extends StatelessWidget {
  final String label;
  final String text;
  const DetailText({
    super.key, required this.label, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff344054),
          ),
        ),
        const SizedBox(height: 5,),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff101828),
          ),
        ),
      ],
    );
  }
}

