import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kelvins_screen/screens/account/add_new_card.dart';
import 'package:kelvins_screen/screens/payment/payment.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
          "OTP Verification",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0xff101828),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Kindly enter the 6-digit verification code that was sent to 091*****8778.",
              style: TextStyle(fontSize: 14, color: Color(0xff667085)),
            ),
            const SizedBox(
              height: 30,
            ),
            const AppTextField(
              hint: "Enter OTP",
              label: "OTP",
            ),

            const SizedBox(
              height: 70,
            ),

            /// Replace with button widget
            GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return const SuccessDialog();
                    });
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
                      "Verify Card",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This form is encrypted",
                  style: TextStyle(fontSize: 12, color: Color(0xff667085)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Icon(
                    Icons.check_circle,
                    color: Color(0xffF26520),
                    size: 20,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 181,
              child: Stack(
                children: [
                  Center(
                      child:
                          SvgPicture.asset("assets/svgs/Group 1171275091.svg")),
                  const Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xffF26520),
                      child: Icon(
                        Iconsax.card,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Card Added",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff101828),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "You have successfully added a new bank card",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff344054),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentScreen(),
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
                      "Ok",
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
