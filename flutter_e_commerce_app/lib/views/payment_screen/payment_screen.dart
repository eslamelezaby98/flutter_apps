import 'package:fltter_e_commerce_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Payment',
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // add code
              PromotionalCardsWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Select a payment method:',
                ),
              ),
              SizedBox(height: 10),
              // Cash on delivery
              PaymentMethodWidget(
                size: size,
                title: 'Cash on Delivery (COD)',
              ),
              SizedBox(height: 10),
              // add a payment method.
              PaymentMethodWidget(
                size: size,
                title: 'Add a payment method',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PromotionalCardsWidget extends StatelessWidget {
  const PromotionalCardsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black26),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Gift Cards Or Promotional Cards',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: 'Enter a Code',
                hintStyle: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(height: 25),
            // Submit
            Padding(
              padding: const EdgeInsets.only(right: 70, left: 70),
              child: Center(
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    // color: Color(0xff0B1423),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                      child: Text(
                    'SUBMIT',
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    Key? key,
    required this.size,
    required this.title,
  }) : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        height: 100,
        width: size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
