import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kelvins_screen/screens/tracking_overview_detail.dart';

class TrackingOverView extends StatelessWidget {
  const TrackingOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFFF7F7F7),
            child: Icon(Iconsax.arrow_left,
            color: Color(0XFF080B30),),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Shipments",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500,
          color: const Color(0xff101828)
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    constraints: const BoxConstraints(maxHeight: 57),
                    filled: true,
                    fillColor: const Color(0XFFFAFAFA),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color(0xffF26520),
                      ),
                    ),
                    hintText: "Enter tracking ID",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9E9E9E),
                    ),
                    suffixIcon: const Icon(Iconsax.search_status),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: filters.map((filter) {
                    return Chip(
                      label: Text(
                        filter,
                        style: TextStyle(
                            color: filter == 'All'
                                ? Colors.white
                                : const Color(0xff101828),
                            fontSize: 12),
                      ),
                      backgroundColor: filter == 'All'
                          ? const Color(0xffF26520)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color(0xffEAECF0),
                        ),
                      ),
                      side: BorderSide(
                        color: filter == 'All'
                            ? Colors.transparent
                            : const Color(0xffEAECF0),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> TrackingOverViewDetail()));
                      },
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:80,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xffFFF7E4),
                                    child:
                                        SvgPicture.asset('assets/svgs/3d_square.svg'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tracking Number',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff344054)),
                                  ),
                                  const SizedBox(height: 7,),
                                  Text(
                                    shipments[index].id,
                                    style: const TextStyle(
                                        fontSize: 14, color: Color(0xff101828),fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        shipments[index].source,
                                        style: const TextStyle(
                                            fontSize: 14, color: Color(0xff101828),fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 5,),
                                      const Icon(Icons.arrow_forward_rounded,color: Color(0xffF26520),),
                                      const SizedBox(width: 5,),
                                      Text(
                                        shipments[index].destination,
                                        style: const TextStyle(
                                            fontSize: 14, color: Color(0xff101828),fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pickup Date',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff344054)),
                                  ),
                                  const SizedBox(height: 7,),
                                  const Text(
                                    '19 Nov 2023',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff101828),fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 15,),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    decoration: BoxDecoration(
                                      color: shipments[index].delivered?
                                      const Color(0XFFECFDF3):const Color(0XFFEFF8FF),
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Text(
                                        shipments[index].delivered? 'In Transit':'Delivered',
                                      style: TextStyle(
                                        fontSize: 12,color: shipments[index].delivered?
                                      const Color(0XFF12B76A):const Color(0XFF175CD3),
                                      ),
                                    ),

                                  )
                                ],
                              ),
                              const SizedBox(width: 25,),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff667085),
                              )

                            ],
                          ),
                          const Divider(color: Color(0xffEAECF0),)


                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: shipments.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> filters = ['All', 'Pending', 'On Delivery', 'Delivered'];

class Shipment {
  final String id;
  final String source;
  final String destination;
  final bool delivered;

  Shipment( {required this.id, required this.source, required this.destination,required this.delivered,});
}

List<Shipment> shipments = [
  Shipment(id: '123FYHJD1', source: 'Gwarimpa', destination: 'Karu',delivered: false),
  Shipment(id: '144GTUJ2', source: 'Abuja', destination: 'Lagos',delivered: false),
  Shipment(id: '564VYHJR3', source: 'Asokoro', destination: 'Mpape',delivered: false),
  Shipment(id: '123FYHJD1', source: 'Gwarimpa', destination: 'Karu',delivered: false),
  Shipment(id: '144GTUJ2', source: 'Abuja', destination: 'Lagos',delivered: true),

];