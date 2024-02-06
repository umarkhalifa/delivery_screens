import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kelvins_screen/screens/payment/select_fund_payment.dart';

class SelectPaymentScreen extends StatelessWidget {
  const SelectPaymentScreen({super.key});

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
          "Select payment method",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0xff101828),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Choose a secure and convenient payment method to add funds to your wallet.",
              style: TextStyle(fontSize: 14, color: Color(0xff344054)),
            ),
            const SizedBox(
              height: 30,
            ),
            Material(
              elevation: 0,
              color: const Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(24),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0xffFC7233),
                      child: const SizedBox(
                        height: 42,
                        width: 42,
                        child: Icon(
                          Iconsax.bank,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bank Transfer",
                          style:
                              TextStyle(color: Color(0xff101828), fontSize: 14),
                        ),
                        Text(
                          "Make your payment through bank transfer",
                          style:
                              TextStyle(color: Color(0xff344054), fontSize: 12),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Color(0xff344054),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectFundPaymentScreen(),
                  ),
                );
              },
              child: Material(
                elevation: 0,
                color: const Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(24),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xffFC7233),
                        child: const SizedBox(
                          height: 42,
                          width: 42,
                          child: Icon(
                            Iconsax.card,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pay with card",
                            style: TextStyle(
                                color: Color(0xff101828), fontSize: 14),
                          ),
                          Text(
                            "Securely pay with your bank card",
                            style: TextStyle(
                                color: Color(0xff344054), fontSize: 12),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Color(0xff344054),
                      )
                    ],
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
