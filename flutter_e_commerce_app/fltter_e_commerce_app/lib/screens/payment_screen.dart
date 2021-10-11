import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F7F7),
        title: Text(
          'Payment',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
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
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
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
        color: Color(0xffEC981A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
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
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
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
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
        //TODO: Move to payment method
      },
      child: Container(
        height: 100,
        width: size.width,
        decoration: BoxDecoration(
          color: Color(0xff0B1423),
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
