import 'dart:convert';

import 'package:e_commerce_fluter_app/my_keys.dart';
import 'package:http/http.dart' as http;

class PaymodServcie {
  Future<String> getToken() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://accept.paymob.com/api/auth/tokens'));
    request.body = json.encode({"api_key": MyKeys.apiKey});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      var result = await response.stream.bytesToString();
      var token = jsonDecode(result);
      var tokenValue = token['token'];
      return tokenValue;
    } else {
      throw Exception();
    }
  }

  Future getId() async {
    var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('https://accept.paymob.com/api/ecommerce/orders'));
request.body = json.encode({
  "auth_token": getToken(),
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
  }
}
