import 'package:flutter/material.dart';

class PaymentOption with ChangeNotifier{
  int? selectedService;
  int selectedAmount=0;


  void changeSelectedService(selectedServices){
    selectedService = selectedServices;
    notifyListeners();
  }
  void changeSelectedAmount(int amount){
    selectedAmount = amount;
    notifyListeners();

  }
}