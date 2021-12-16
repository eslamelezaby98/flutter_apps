import 'package:flutter/material.dart';

class SearchModelView extends ChangeNotifier {
  bool isSearch = false;
  List allUser = []; // from firebase
  List userSearch = [];

  onTapSearch() {
    if (isSearch == true) {
      buildSearchBarWidget();
    } else {
      buildAppBarwidget();
    }
  }

  buildSearchBarWidget() {
    return  TextField(
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          hintStyle:
            TextStyle(color: Colors.black, fontSize: 18),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 18),
        onChanged: (value) {
          //TODO: 
        },
    );
  }

  buildAppBarwidget() {
    // return 
  }
}
