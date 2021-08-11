import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final Function onSave;
  final String hintText;
  final Function validator;
  final bool isObscured;

  const CustomTextField(
      {this.title,
      this.onSave,
      this.hintText,
      this.validator,
      this.isObscured = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
          obscureText: isObscured,
          onSaved: onSave,
          validator: validator,
        ),
      ],
    );
  }
}
