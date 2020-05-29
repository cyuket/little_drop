import 'package:little_drops/models/item_model.dart';
import 'package:little_drops/models/order_model.dart';

import 'base_model.dart';
import 'package:little_drops/locator.dart';
import 'package:little_drops/services/firestore_service.dart';

class OrderProgressViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  OrderModel order;

  OrderModel getOrderDetail(var data) {
    List<ItemModel> items = [];
    for (var item in data["orderDetails"]) {
      items.add(ItemModel.fromData(item));
    }

    var orderModel = OrderModel(
      status: data["status"],
      reference: data["reference"],
      user: data["user"],
      placed: data["placed"],
      picked: data["picked"],
      pickup: data["pickup"],
      washing: data["washing"],
      packed: data["packed"],
      delivery: data["delivery"],
      orderDetails: items,
      paymentType: data["paymentType"],
      pickupDate: DateTime.fromMillisecondsSinceEpoch(
          data["pickupDate"].millisecondsSinceEpoch),
      deliveryDate: DateTime.fromMillisecondsSinceEpoch(
          data["deliveryDate"].millisecondsSinceEpoch),
      deliveryTime: data["deliveryTime"],
      pickupTime: data["pickupTime"],
      deliveryAddress: data["deliveryAddress"],
      pickupAddress: data["pickupAddress"],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          data["createdAt"].millisecondsSinceEpoch),
      orderNumber: data["orderNumber"],
    );

    return orderModel;
  }
}
