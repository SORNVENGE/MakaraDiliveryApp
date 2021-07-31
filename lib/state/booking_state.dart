import 'package:flutter/material.dart';

class BookingState extends ChangeNotifier {
  String _senderPhone = "";
  String _senderName = "";
  String _senderAddress = "";
  String _senderDetailAddress = "";
  String _receiverPhone = "";
  String _receiverName = "";
  String _receiverAddress = "";
  String _receiverDetailAddress = "";
  String _weight = "";
  String _insuredAmount = "";
  String _codAmount = "";
  String _bank = "";
  String _accountHolder = "";
  String _bankCardNumber = "";
  String _itemDetail = "";
  String _estimatedTotalPrice = "";
  String _basicCost = "";

  String get senderPhone => _senderPhone;
  String get senderName => _senderName;
  String get senderAddress => _senderAddress;
  String get senderDetailAddress => _senderDetailAddress;
  String get receiverPhone => _receiverPhone;
  String get receiverName => _receiverName;
  String get receiverAddress => _receiverAddress;
  String get receiverDetailAddress => _receiverDetailAddress;
  String get weight => _weight;
  String get insuredAmount => _insuredAmount;
  String get codAmount => _codAmount;
  String get bank => _bank;
  String get accountHolder => _accountHolder;
  String get bankCardNumber => _bankCardNumber;
  String get itemDetail => _itemDetail;
  String get estimatedTotalPrice => _estimatedTotalPrice;
  String get basicCost => _basicCost;
  void changeSenderPhone(value) {
    _senderPhone = value;
    notifyListeners();
  }
  void changeSenderName(value) {
    _senderName = value;
    notifyListeners();
  }
  void changeSenderAddress(value) {
    _senderAddress = value;
    notifyListeners();
  }
  void changeSenderDetailAddress(value) {
    _senderDetailAddress = value;
    notifyListeners();
  }
  
  void changeReceiverPhone(value) {
    _receiverPhone = value;
    notifyListeners();
  }
  void changeReceiverName(value) {
    _receiverName = value;
    notifyListeners();
  }
  void changeReceiverAddress(value) {
    _receiverAddress = value;
    notifyListeners();
  }
  void changeReceiverDetailAddress(value) {
    _receiverDetailAddress = value;
    notifyListeners();
  }
  void changeWeight(value) {
    _weight = value;
    notifyListeners();
  }
  void changeInsuredAmount(value) {
    _insuredAmount = value;
    notifyListeners();
  }
  void changeCodAmount(value) {
    _codAmount = value;
    notifyListeners();
  }
  void changeItemDetail(value) {
    _itemDetail = value;
    notifyListeners();
  }
  void changeBank(value) {
    _bank = value;
    notifyListeners();
  }
  void changeAccountHolder(value) {
    _accountHolder = value;
    notifyListeners();
  }
  void changeBankCardNumber(value) {
    _bankCardNumber = value;
    notifyListeners();
  }
  void changeEstimatedTotalPrice(value) {
    _estimatedTotalPrice = value;
    notifyListeners();
  }
  void changeBasicCost(value) {
    _basicCost = value;
    notifyListeners();
  }



}
