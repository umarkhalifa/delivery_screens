import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
class FundWalletScreen extends StatelessWidget {
  const FundWalletScreen({super.key});

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
            color: Color(0xff101828),
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              SizedBox(width: 220,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffEAECF0))
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF26520))
                  ),
                  prefixStyle: GoogleFonts.roboto(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff101828)
                  ),
                  hintText: "0.00",
                  alignLabelWithHint: true,
                  label: const Center(child: Text("Enter Amount")),
                  labelStyle: const TextStyle(fontSize: 16,color: Color(0xff667085)),
                  hintStyle: const TextStyle(
                    fontSize: 40,
                    color: Color(0xff9E9E9E)
                  ),
                ),
                style: GoogleFonts.inter(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff101828)
                ),
                controller: TextEditingController(text: '₦5000'),
              ),),
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Quick amount selection",style: TextStyle(
                  fontSize: 12,color: Color(0xff344054)
                ),),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: amounts.sublist(0,4).map((e) {
                  return Material(
                    color: const Color(0xffFDF6F3),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Text(e,style: GoogleFonts.inter(
                        fontSize: 15,color: Color(0xff344054)
                      ),),

                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: amounts.sublist(4).map((e) {
                  return Material(
                    color: const Color(0xffFDF6F3),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      child: Text(e,style: GoogleFonts.inter(
                        fontSize: 15,color: Color(0xff344054)
                      ),),

                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
List<String> amounts = [
  '₦1,000','₦2,000','₦5,000','₦10,000','₦12,000','₦15,000','₦20,000','₦25,0000'
];