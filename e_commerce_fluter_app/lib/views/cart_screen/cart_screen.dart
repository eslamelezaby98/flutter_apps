import 'package:e_commerce_fluter_app/views/widgets/screen_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildScreenTitle(context, 'Shopping', "Cart"),
                    IconButton(
                      onPressed: () {
                        //! delete
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: const Key('myKey'),
                        resizeDuration: const Duration(microseconds: 100),
                        direction: DismissDirection.endToStart,
                        secondaryBackground: Container(
                          color: Colors.blue,
                        ),
                        background: Container(
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Container(
                              height: 150,
                              width: 70,
                              child: const Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/shoe_tilt_2.png',
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                            trailing: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'x1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nike Air Max 200',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '240.00 \$',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          //! bottom
          CheckoutWidget(size: size),
        ],
      ),
    );
  }
}

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 5,
      width: size.width,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '3 item',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    '600.00 \$',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ApplePayButton(
                  paymentConfigurationAsset: 'apple.json',
                  paymentItems: const [
                    PaymentItem(
                      label: 'Total',
                      amount: '99.99',
                      status: PaymentItemStatus.final_price,
                    )
                  ],
                  style: ApplePayButtonStyle.black,
                  type: ApplePayButtonType.buy,
                  margin: const EdgeInsets.only(top: 15.0),
                  onPaymentResult: (result) {
                    print(result);
                  },
                  loadingIndicator: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  width: size.width / 2,
                  height: 50,
                ),
                GooglePayButton(
                  paymentConfigurationAsset: 'gpay.json',
                  margin: const EdgeInsets.only(top: 15.0),
                  width: size.width / 2,
                  height: 50,
                  loadingIndicator: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  paymentItems: const [
                    PaymentItem(
                      label: 'Total',
                      amount: '99.99',
                      status: PaymentItemStatus.final_price,
                    )
                  ],
                  style: GooglePayButtonStyle.black,
                  type: GooglePayButtonType.pay,
                  onPaymentResult: (result) {
                    print(result);
                  },
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text(
            //     'Next',
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: const Size(100, 40),
            //     primary: ColorManager.secondColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
