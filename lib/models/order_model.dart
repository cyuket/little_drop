import 'package:flutter/material.dart';
import 'package:little_drops/models/item_model.dart';
import 'package:little_drops/models/user.dart';

class OrderModel {
  final bool status;
  final String reference, orderNumber;
  final String paymentType;
  final String user;
  final bool placed, pickup, picked, washing, packed, delivery;
  final DateTime pickupDate, deliveryDate, createdAt;
  final String pickupTime, deliveryTime;
  final String pickupAddress, deliveryAddress;
  List<dynamic> orderDetails;
  OrderModel({
    this.status = false,
    this.orderDetails,
    this.reference,
    this.user,
    this.delivery = false,
    this.pickup = false,
    this.picked = false,
    this.packed = false,
    this.placed = false,
    this.washing = false,
    this.paymentType,
    this.pickupDate,
    this.deliveryDate,
    this.deliveryTime,
    this.pickupTime,
    this.deliveryAddress,
    this.pickupAddress,
    this.createdAt,
    this.orderNumber,
  });
  OrderModel.fromData(Map<String, dynamic> data)
      : status = data["status"],
        reference = data["reference"],
        user = data["user"],
        placed = data["placed"],
        picked = data["picked"],
        pickup = data["pickup"],
        washing = data["washing"],
        packed = data["packed"],
        delivery = data["delivery"],
        orderDetails = data["orderDetails"],
        paymentType = data["paymentType"],
        pickupDate = data["pickupDate"],
        deliveryDate = data["deliveryDate"],
        deliveryTime = data["deliveryTime"],
        pickupTime = data["pickupTime"],
        deliveryAddress = data["deliveryAddress"],
        pickupAddress = data["pickupAddress"],
        createdAt = data["createdAt"],
        orderNumber = data["orderNumber"];

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "reference": reference,
      "user": user,
      "placed": placed,
      "picked": picked,
      "pickup": pickup,
      "washing": washing,
      "packed": packed,
      "delivery": delivery,
      "orderDetails": orderDetails,
      "pickupDate": pickupDate,
      "deliveryDate": deliveryDate,
      "deliveryTime": deliveryTime,
      "pickupTime": pickupTime,
      "deliveryAddress": deliveryAddress,
      "pickupAddress": pickupAddress,
      "paymentType": paymentType,
      "createdAt": createdAt,
      "orderNumber": orderNumber
    };
  }
}
