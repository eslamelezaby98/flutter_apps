import 'package:flutter/material.dart';
import 'package:flutter_maps_app/controller/auth_controller.dart';
import 'package:provider/provider.dart';

class UserPhoneNumberWidget extends StatelessWidget {
  const UserPhoneNumberWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton<String>(
          value: provider.dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: provider.onCountryChange,
          items: provider.conturies
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: provider.phoneNumberController,
            cursorColor: Colors.black,
            autofocus: true,
            keyboardType: TextInputType.phone,
            // textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: '01xx xxxx xxx',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
            onChanged: provider.onPhoneChange,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your phone number";
              } else if (value.length < 11) {
                return "Your phone number is less than 11 numbers!";
              } else if (value.length < 11) {
                return "Your phone number too long!";
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}
