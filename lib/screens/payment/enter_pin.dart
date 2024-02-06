import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
class EnterYourPinScreen extends StatelessWidget {
  const EnterYourPinScreen({super.key});

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
          "Enter your pin",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xff101828)),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height*0.9,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30,),
                const Text("Enter your Shipoka PIN to confirm topup",style: TextStyle(
                  fontSize: 16,color: Color(0xff344054)
                ),),
                const SizedBox(height: 50,),
                OTPTextField(
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  length: 4,
                  controller: OtpFieldController(),
                  width: MediaQuery.sizeOf(context).width ,
                  fieldWidth: 84,
                  style: const TextStyle(fontSize: 17),
                  otpFieldStyle: OtpFieldStyle(
                      focusBorderColor: const Color(0xffF26520),
                      enabledBorderColor:const Color(0xffEEEEEE)),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onChanged: (value){},

                ),
                const SizedBox(height: 100,),
                /// Replace with button widget
                GestureDetector(
                  onTap: () async{
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
              "Top Up Successful",
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
                "You have successfully funded your Shipoka Wallet with ₦5000",
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
                Navigator.pop(context);
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
