import 'package:chat_app/helper/constants_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchController extends ChangeNotifier {
  bool isSearch = false;
  final TextEditingController searchController = TextEditingController();
  late List<String> userSearchFound;
  late List<String> UsersList;
  final firestore = FirebaseFirestore.instance;

  getUserByUserName(String userName) async {
    return await firestore
        .collection(ConstantsManager.users)
        .where(ConstantsManager.userName, isEqualTo: userName)
        .get();
  }

  searchField() {
    return TextField(
      controller: searchController,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  addSearchedFOrItemsToSearchedList(String userName) {
    userSearchFound = getUserByUserName(userName);
    notifyListeners();
  }

  appBarItems(BuildContext context) {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: Theme.of(context).primaryColorDark),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearch(context),
          icon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ];
    }
  }

  clearSearch() {
    searchController.clear();
  }

  startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    isSearch = true;
    notifyListeners();
  }

  stopSearch() {
    clearSearch();
    isSearch = false;
    notifyListeners();
  }
}
