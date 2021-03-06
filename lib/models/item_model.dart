import 'package:flutter/foundation.dart';
import 'package:little_drops/models/services_model.dart';

class ItemModel {
  final String title, iconUrl;
  int qnty;
  String serviceType;
  double pricePerItem, totalPrice;

  ItemModel({
    @required this.title,
    @required this.iconUrl,
    this.qnty = 1,
    @required this.pricePerItem,
    @required this.totalPrice,
    this.serviceType,
  });
  void incrementQty() {
    qnty++;
    totalPrice = pricePerItem * qnty;
  }

  ItemModel.fromData(Map<String, dynamic> data)
      : title = data["title"],
        iconUrl = data["iconUrl"],
        qnty = data["qnty"],
        pricePerItem = data["pricePerItem"],
        totalPrice = data["totalPrice"],
        serviceType = data["serviceType"];
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "iconUrl": iconUrl,
      "qnty": qnty,
      "pricePerItem": pricePerItem,
      "totalPrice": totalPrice,
      "serviceType": serviceType
    };
  }

  void decrementQty() {
    qnty--;
    totalPrice = pricePerItem * qnty;
  }
}
