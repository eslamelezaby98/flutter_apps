import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaypalCheckoutScreen extends StatefulWidget {
  const PaypalCheckoutScreen({Key? key}) : super(key: key);

  @override
  _PaypalCheckoutScreenState createState() => _PaypalCheckoutScreenState();
}

class _PaypalCheckoutScreenState extends State<PaypalCheckoutScreen> {
  //ToDo: Put your payment key
  final String url =
      'https://accept.paymob.com/api/acceptance/iframes/333755?payment_token=PUT_YOUR_PAYMENT_TOKEN';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }
}
