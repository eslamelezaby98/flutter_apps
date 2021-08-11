import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:password_generator/database/db_helper.dart';

class MyControllar extends GetxController {
  final dbHelper = DbHelper.instance;

  TextEditingController siteNameController = TextEditingController();
  TextEditingController lettersController = TextEditingController();
  TextEditingController symbolsController = TextEditingController();
  TextEditingController numbersController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    siteNameController.dispose();
    lettersController.dispose();
    symbolsController.dispose();
    numbersController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    dbHelper.initDatabase();
  }

// Letters & numbers & symbols
  var letters = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  List numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List symbols = ['!', '#', '\$', '%', '&', '(', ')', '*', '+'];

// Functions

  List passwordList = [];
  void getRandomElements(List listOfElements, int lengthOfList) {
    for (int i = 0; i < lengthOfList; i++) {
      final random = Random();
      var randomIndex = random.nextInt(lengthOfList);
      passwordList.add(listOfElements[randomIndex]);
    }
    update();
  }

  void shufflePassword() {
    passwordList.shuffle();
    update();
  }

  String passwordChar = "";
  void passwordToChar() {
    for (var item in passwordList) {
      passwordChar += item;
    }
    update();
  }
  
// copy password
  Future<void> copyToClipbord(textToCopy) async {
    await Clipboard.setData(ClipboardData(text: textToCopy));
    Get.snackbar(
      'Password Copied',
      'Done',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      duration: Duration(seconds: 1),
    );
  }

// update date to defualt
  updateData() {
    passwordChar = "";
    passwordList = [];
    update();
  }


// dark controller
  bool isDark = false;
  switchToDark(bool value) {
    isDark = value;
    print('dark mode active');
    update();
  }


}
