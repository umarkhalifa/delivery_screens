import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kelvins_screen/screens/account/otp_verification.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});

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
          "Add New Card",
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
              "Securely add a bank card",
              style: TextStyle(fontSize: 16, color: Color(0xff344054)),
            ),
            const SizedBox(
              height: 30,
            ),
            AppTextField(
              hint: "Enter Card number",
              label: "Card Number",
              suffixIcon: SvgPicture.asset("assets/svgs/mastercard.svg"),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Expanded(
                  child: AppTextField(
                    hint: "Expiry date 09/25",
                    label: "Expiry date",
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: AppTextField(
                    hint: "CVV e.g 123",
                    label: "CVV",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),

            /// Replace with button widget
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtpVerificationScreen(),
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
                      "Verify Card",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final String? label;
  final String? hint;
  final double? radius;

  const AppTextField({
    super.key,
    this.suffixIcon,
    this.label,
    this.hint, this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xff9E9E9E),
          ),
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xff9E9E9E),
          ),
          labelText: label,
          filled: true,
          fillColor: const Color(0xffFAFAFA),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??10),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??10),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
          suffixIcon: suffixIcon),
    );
  }
}
