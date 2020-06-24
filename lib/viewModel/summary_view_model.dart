import 'dart:math';
import 'package:flutter/material.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/models/order_model.dart';
import 'package:little_drops/models/user.dart';
import 'package:little_drops/services/authentication_service.dart';
import 'package:little_drops/services/firestore_service.dart';
import 'package:little_drops/services/navigation_service.dart';
import 'package:little_drops/services/paystack_service.dart';
import 'base_model.dart';
import 'package:little_drops/services/item_selection_services.dart';
import 'package:little_drops/locator.dart';

class SummaryViewModel extends BaseModel {
  final ItemSelectionServices _itemSelectionServices =
      locator<ItemSelectionServices>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final PaystackService _paystackService = locator<PaystackService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();

  // getting selected Items
  User get user => _authenticationService.currentUser;
  double get amount => _itemSelectionServices.selectedTotal;
  double get totalAmount => _itemSelectionServices.totalAmount;
  double get deliveryAmount => _itemSelectionServices.deliveryAmount;
  String get pickupAdress => _itemSelectionServices.pickupAdress;
  String get deliveryAdress => _itemSelectionServices.deliveryAdress;
  DateTime get pickUpDate => _itemSelectionServices.pickUpDate;
  DateTime get deliveryDate => _itemSelectionServices.deliveryDate;
  TimeOfDay get pickUpTime => _itemSelectionServices.pickUpTime;
  TimeOfDay get deliveryTime => _itemSelectionServices.deliveryTime;
  String get paymentMethod => _itemSelectionServices.paymentMethod;

  Future processPayment(String reference, BuildContext context) async {
    setBusy(true);
    await _paystackService.chargeCard(reference, context);
    setBusy(false);
  }

  Future makeOrder(BuildContext context) async {
    setBusy(true);
    List _items = [];
    for (var item in _itemSelectionServices.selectedItems) {
      var detail = item.toJson();
      _items.add(detail);
    }
    var rng = new Random();
    var number = rng.nextInt(2000);

    OrderModel order = OrderModel(
      status: false,
      orderDetails: _items,
      reference: "",
      user: _authenticationService.currentUser.id,
      paymentType: _itemSelectionServices.paymentMethod,
      placed: true,
      pickupDate: _itemSelectionServices.pickUpDate,
      pickupTime: _itemSelectionServices.pickUpTime.format(context),
      deliveryDate: _itemSelectionServices.deliveryDate,
      deliveryTime: _itemSelectionServices.deliveryTime.format(context),
      deliveryAddress: _itemSelectionServices.deliveryAdress,
      pickupAddress: _itemSelectionServices.pickupAdress,
      createdAt: new DateTime.now(),
      orderNumber: "ORD$number",
    );
    await _firestoreService.createOrder(order).then((value) {
      _navigationService.removeAllAndNavigateTo(OrderProgressRoute,
          arguments: value.toString());
      _itemSelectionServices.clearData();
    });

    setBusy(false);
  }
}
