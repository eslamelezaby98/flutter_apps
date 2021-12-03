import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({this.buttonColor, this.buttonTitle, this.onPressed});
  final Color buttonColor;
  final String buttonTitle;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(150, 50),
          side: BorderSide(color: Colors.black)),
    );
  }
}

// BuildInputTextFiled
class BuildInputText extends StatelessWidget {
  const BuildInputText({
    this.hintText,
    this.keyboardType,
    this.onChange,
    this.textEditingController,
  });

  final String hintText;
  final TextInputType keyboardType;
  final Function onChange;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(
          color: Colors.white,
        ),
        controller: textEditingController,
        autofocus: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
