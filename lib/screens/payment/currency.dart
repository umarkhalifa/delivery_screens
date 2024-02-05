import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kelvins_screen/screens/account/add_new_card.dart';
class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

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
          "Currency",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0xff101828),
          ),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          children: [
            const AppTextField(
              hint: "Search for currency",
              suffixIcon: Icon(Iconsax.search_status),
              radius: 20,
            ),
            const SizedBox(height: 30,),
            Column(
              children: currencies.map((e){
                return Material(
                  color: e['code']! == 'NGN'? const Color(0xffFAFAFA):Colors.white,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e['code']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff344054)
                              ),),
                              Text(e['title']!,style: const TextStyle(
                                fontSize: 14,color: Color(0xff667085)
                              ),),


                            ],
                          ),
                          const Spacer(),
                          e['code']! == 'NGN'?
                          const Icon(Icons.check,color:  Color(0xffF26520),):const SizedBox()
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String,String>> currencies = [
  {
    'code':'NGN',
    'title':"Nigerian Naira"
  },
  {
    'code':'USD',
    'title':"US  Dollar"
  },{
    'code':'EUR',
    'title':"Euro"
  },
  {
    'code':'AED',
    'title':"UAE Dirham"
  },
  {
    'code':'AUD',
    'title':"Australian Dollar"
  },
  {
    'code':'Ars',
    'title':"Argentine Peso"
  },



];