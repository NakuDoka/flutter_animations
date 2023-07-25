import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // list to check if the user have chosen the intrests
  List _listChosen = [];

  List get listChosen => _listChosen;
  set listChosen(List listChosen) {
    _listChosen = listChosen;
    notifyListeners();
  }

  void changeIntChosen(List listChosen) {
    _listChosen = listChosen;
    notifyListeners();
  }

  void addToIntChosen(int intChosen) {
    _listChosen.add(intChosen);
    notifyListeners();
  }

  void removeFromIntChosen(int intChosen) {
    _listChosen.remove(intChosen);
    notifyListeners();
  }
}
