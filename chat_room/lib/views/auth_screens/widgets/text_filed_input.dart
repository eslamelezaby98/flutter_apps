import 'package:flutter/material.dart';

class TextFiledInput extends StatelessWidget {
  const TextFiledInput({
    Key? key,
    required this.hintLabel,
    required this.isObcure,
    required this.onChange,
    required this.textEditingController,
  }) : super(key: key);

  final String hintLabel;
  final bool isObcure;
  final Function(String)? onChange;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintLabel,
        ),
        obscureText: isObcure,
        onChanged: onChange,
      ),
    );
  }
}
