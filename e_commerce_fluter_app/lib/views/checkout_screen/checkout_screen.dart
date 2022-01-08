import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CheckoutInfoWidget(),
            const SizedBox(height: 10),
            Text(
              'Choice your payment methods:',
              style: Theme.of(context).textTheme.headline2,
            ),
            //! google and apple pay.
            const GoolgeAndApplePayWidget(),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                //TODO: add checkout method.
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.payment_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Pay with checkout gatway',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoolgeAndApplePayWidget extends StatelessWidget {
  const GoolgeAndApplePayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
          width: 200,
          height: 50,
        ),
        GooglePayButton(
          paymentConfigurationAsset: 'gpay.json',
          margin: const EdgeInsets.only(top: 15.0),
          width: 200,
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
    );
  }
}

class CheckoutInfoWidget extends StatelessWidget {
  const CheckoutInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: const [
            Icon(Icons.card_travel),
            Text(
              '10 items',
            ),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.payment),
            Text(
              '1500 \$',
            ),
          ],
        ),
      ],
    );
  }
}
