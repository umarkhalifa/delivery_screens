import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kelvins_screen/screens/payment/enter_pin.dart';

class SelectFundPaymentScreen extends StatelessWidget {
  const SelectFundPaymentScreen({super.key});

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
            child: Icon(
              Iconsax.arrow_left,
              color: Color(0XFF080B30),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Fund Wallet",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xff101828)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select the top up method you want to use",
              style: TextStyle(fontSize: 16, color: Color(0xff344054)),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Material(
                    elevation: 0,
                    color: const Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(24),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/svgs/Group 2085661580.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "27872******* 6722",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff101828),
                                ),
                              ),
                              Text(
                                "Mastercard",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff344054),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Radio(
                            value: 'sk',
                            groupValue: false,
                            onChanged: (value) {},
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff344054),
                  radius: 10,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Add new card",
                  style: TextStyle(color: Color(0xffF26520), fontSize: 14),
                )
              ],
            ),
            const Spacer(),

            /// Replace with button widget
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EnterYourPinScreen(),
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
    );
  }
}
