import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kelvins_screen/screens/payment/currency.dart';
import 'package:kelvins_screen/screens/payment/fund_wallet.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
          "Payment",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0xff101828),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Material(
              elevation: 0,
              color: const Color(0xffF26520),
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Shipoka balance",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: '₦',
                              style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              children: [
                                TextSpan(
                                    text: "2,430.00",
                                    style: GoogleFonts.dmSans(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white))
                              ]),
                        ),
                        const Spacer(),
                        Material(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xff101828),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const FundWalletScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Fund wallet",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text(
                          "What is Shipoka Wallet balance?",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CurrencyScreen()));
              },
              child: Material(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(20),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        "Currency Preference",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff344054)),
                      ),
                      Spacer(),
                      Text(
                        "NGN",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff344054),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Color(0xff344054),
                      )
                    ],
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
