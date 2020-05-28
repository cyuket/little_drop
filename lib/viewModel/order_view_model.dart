import 'package:little_drops/models/item_model.dart';
import 'package:little_drops/models/order_model.dart';
import 'package:little_drops/services/authentication_service.dart';

import 'base_model.dart';
import 'package:little_drops/locator.dart';
import 'package:little_drops/services/firestore_service.dart';

class OrderViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  List<OrderModel> orders = [];

  void fetchOrder() async {
    setBusy(true);
    var result = await _firestoreService
        .fetchAllOrder(_authenticationService.currentUser.id);
    for (var order in result) {
      List<ItemModel> items = [];

      for (var item in order.data["orderDetails"]) {
        items.add(ItemModel.fromData(item));
      }

      var orderModel = OrderModel(
        status: order.data["status"],
        reference: order.data["reference"],
        user: order.data["user"],
        placed: order.data["placed"],
        picked: order.data["picked"],
        pickup: order.data["pickup"],
        washing: order.data["washing"],
        packed: order.data["packed"],
        delivery: order.data["delivery"],
        orderDetails: items,
        paymentType: order.data["paymentType"],
        pickupDate: DateTime.fromMillisecondsSinceEpoch(
            order.data["pickupDate"].millisecondsSinceEpoch),
        deliveryDate: DateTime.fromMillisecondsSinceEpoch(
            order.data["deliveryDate"].millisecondsSinceEpoch),
        deliveryTime: order.data["deliveryTime"],
        pickupTime: order.data["pickupTime"],
        deliveryAddress: order.data["deliveryAddress"],
        pickupAddress: order.data["pickupAddress"],
        createdAt: DateTime.fromMillisecondsSinceEpoch(
            order.data["createdAt"].millisecondsSinceEpoch),
      );
      orders.add(orderModel);
      // print(OrderModel.fromData(order.data));
    }
    setBusy(false);
    // print(result);
  }
}
