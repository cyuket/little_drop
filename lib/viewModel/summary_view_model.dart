import 'package:flutter/material.dart';
import 'package:little_drops/models/user.dart';
import 'package:little_drops/services/authentication_service.dart';

import 'base_model.dart';
import 'package:little_drops/services/item_selection_services.dart';
import 'package:little_drops/locator.dart';

class SummaryViewModel extends BaseModel {
  final ItemSelectionServices _itemSelectionServices =
      locator<ItemSelectionServices>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

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
}
