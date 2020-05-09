import 'package:flutter/foundation.dart';

class ItemModel {
  final String title, iconUrl;
  int qnty;
  double washingPrice, ironningPrice, washingAndIronningPrice;

  ItemModel({
    @required this.title,
    @required this.iconUrl,
    this.qnty = 0,
    this.ironningPrice,
    this.washingAndIronningPrice,
    this.washingPrice,
  });
  void incrementQty() {
    qnty++;
  }

  void decrementQty() {
    qnty--;
  }
}
