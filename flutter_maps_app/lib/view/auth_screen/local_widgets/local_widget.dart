import 'package:flutter/material.dart';

class LocalWidget {
  static Text buildHeaderText(String header) {
    return Text(
      header,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }


  static   InkWell buildCustomButton(Function onTap, String title) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
