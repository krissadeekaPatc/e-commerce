import 'package:flutter/foundation.dart';

class CheckOutViewProvier extends ChangeNotifier {
  String qrCode = "";
  bool isLoading = false;
  initData(double price) {
    qrCode = "https://payment.spw.challenge/checkout?price=$price";
    notifyListeners();
  }
}
