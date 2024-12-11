import 'package:flutter/material.dart';

class ListViewProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _mData = [];

  void addData(Map<String, dynamic> data) {
    _mData.add(data);
    notifyListeners();
  }

  void updateData(Map<String, dynamic> updateddata, int index) {
    _mData[index] = updateddata;
    notifyListeners();
  }

  void deletedata(int index) {
    _mData.removeAt(index);
    notifyListeners();
  }

  // getter
  List<Map<String, dynamic>> getData() => _mData;
}
