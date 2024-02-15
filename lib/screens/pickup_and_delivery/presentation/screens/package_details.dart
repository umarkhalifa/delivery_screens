import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kelvins_screen/screens/pickup_and_delivery/presentation/providers/shipment_provider.dart';
import 'package:kelvins_screen/screens/pickup_and_delivery/presentation/widgets/package_details.dart';
import 'package:provider/provider.dart';

class PackageDetailsScreen extends StatelessWidget {
  const PackageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shipmentProvider = Provider.of<ShipmentProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFB),
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
          "Package Details",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0xff101828),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Please share information about your outgoing package",
                style: TextStyle(fontSize: 16, color: Color(0xff344054)),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return PackageDetails(
                    index: index,
                    package: shipmentProvider.pacakages[index],
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: shipmentProvider.pacakages.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              const SizedBox(height: 15,),
              shipmentProvider.canAddPackage ?Align(alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.add_circle,color: Color(0xff344054),size: 18,),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        shipmentProvider.addNewPackage();
                      },
                      child: const Text("Add new package",style: TextStyle(
                          fontSize: 14,color: Color(0xffF26520)
                      ),),
                    )
                  ],
                ),
              ):const SizedBox.shrink(),
              const SizedBox(height: 50,),
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




