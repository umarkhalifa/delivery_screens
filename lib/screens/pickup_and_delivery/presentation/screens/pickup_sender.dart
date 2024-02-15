import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kelvins_screen/screens/account/add_new_card.dart';
import 'package:kelvins_screen/screens/pickup_and_delivery/presentation/providers/shipment_provider.dart';
import 'package:kelvins_screen/screens/pickup_and_delivery/presentation/screens/pickup_receiver.dart';
import 'package:provider/provider.dart';

class PickupDetailsSender extends StatelessWidget {
  const PickupDetailsSender({super.key});

  @override
  Widget build(BuildContext context) {
    final shipmentProvider = Provider.of<ShipmentProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFFF7F7F7),
            child: Icon(
              Iconsax.arrow_left,
              color: Color(0XFF080B30),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Pickup & Delivery Detail",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xff101828)),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sender Information",
                  style: TextStyle(fontSize: 18, color: Color(0xff101828)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Please provide the sender's details",
                  style: TextStyle(fontSize: 14, color: Color(0xff667085)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const AppTextField(
                  label: 'Sender Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: AppTextField(
                          controller: TextEditingController(text: "+234"),
                          suffixIcon: const Icon(Icons.arrow_drop_down,
                              color: Color(0xff101828)),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: AppTextField(label: "Sender Phone Number"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const AppTextField(
                  label: 'Sender Email',
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                            width: 1.0, color: Color(0xffF26520)),
                      ),
                      value: true,
                      onChanged: (bool? value) {},
                      checkColor: const Color(0xffF26520),
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                    ),
                    /// THIS TEXT SHOULD BE REVIEWED, WHAT HAPPENS IF ITS LONGER
                    /// THAN THE SCREEN
                    const Text(
                      "Pickup information is the same as the sender location",
                      style: TextStyle(fontSize: 12, color: Color(0xff667085)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Pickup Location",
                  style: TextStyle(fontSize: 18, color: Color(0xff101828)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                            width: 1.0, color: Color(0xffF26520)),
                      ),
                      value: shipmentProvider.showSavedLocation,
                      onChanged: (bool? value) {
                        shipmentProvider.updateShowSavedLocation();
                      },
                      checkColor: const Color(0xffF26520),
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Saved Locations",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff344054)),
                        ),
                        Text(
                          "Enable the option to view your saved locations",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff667085)),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                shipmentProvider.showSavedLocation
                    ? const SavedLocationEnabled()
                    : const SavedLocationForm(),
                const SizedBox(height: 40,),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PickupDetailsReceiver(),
                      ),
                    );
                  },
                  child: Material(
                    elevation: 0,
                    color: const Color(0xffF26520),
                    borderRadius: BorderRadius.circular(40),
                    child: SizedBox(
                      height: 57,
                      width: MediaQuery.sizeOf(context).width,
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SavedLocationForm extends StatelessWidget {
  const SavedLocationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppTextField(
          hint: "Country region",
          suffixIcon: Icon(Icons.arrow_drop_down, color: Color(0xff101828)),
        ),
        SizedBox(
          height: 15,
        ),
        AppTextField(
          hint: 'Address eg 123 kent street',
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
                child: AppTextField(
              hint: 'City',
            )),
            Expanded(
              child: AppTextField(
                hint: 'State',
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xff101828),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SavedLocationEnabled extends StatelessWidget {
  const SavedLocationEnabled({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
      return const Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffF26520),
            child: Icon(
              Iconsax.location,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Joseph Jones",
                style: TextStyle(fontSize: 14, color: Color(0xff344054)),
              ),
              Text(
                '961 Townhall, Blue city Abuja, nigeria 90001',
                style: TextStyle(fontSize: 14, color: Color(0xff667085)),
              )
            ],
          )
        ],
      );
    }, separatorBuilder: (_,__){
      return const SizedBox(height: 30,);
    }, itemCount: 3,shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),);
  }
}
