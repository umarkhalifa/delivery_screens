import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kelvins_screen/screens/account/add_new_card.dart';
import 'package:kelvins_screen/screens/pickup_and_delivery/presentation/providers/shipment_provider.dart';
import 'package:kelvins_screen/screens/pickup_and_delivery/presentation/screens/package_details.dart';
import 'package:provider/provider.dart';

class PickupDetailsReceiver extends StatelessWidget {
  const PickupDetailsReceiver({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Receiver Information",
                style: TextStyle(fontSize: 18, color: Color(0xff101828)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Please provide the sender's details",
                style: TextStyle(fontSize: 14, color: Color(0xff667085)),
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),
              const AppTextField(
                hint: 'Receiver Name',
              ),
              const SizedBox(
                height: 15,
              ),
              const AppTextField(
                hint: 'Receiver Phone Number',
              ),
              const SizedBox(
                height: 15,
              ),
              const AppTextField(
                hint: 'Receiver Email',
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                      context: context,
                      builder: (context) => const CountryBottomSheet(),
                      backgroundColor: Colors.transparent);
                },
                child: const AppTextField(
                  hint: "Country region",
                  enabled: false,
                  suffixIcon:
                      Icon(Icons.arrow_drop_down, color: Color(0xff101828)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const AppTextField(
                hint: 'Address eg 123 kent street',
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
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
              const SizedBox(
                height: 15,
              ),
              const AppTextField(
                hint: 'Delivery Instructions(Optional)',
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PackageDetailsScreen(),
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
    );
  }
}

class CountryBottomSheet extends StatelessWidget {
  const CountryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          const AppTextField(
            hint: "Search Country",
            suffixIcon: Icon(
              Iconsax.search_status,
              color: Color(0xff101828),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SvgPicture.asset("assets/svgs/Japan-${index + 1}.svg"),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    countries[index],
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xff101828)),
                  ),
                ],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}

List<String> countries = [
  'Albania',
  'Armenia',
  'Algeria',
  'Andorra',
  'Angola',
  'Argentina'
];
