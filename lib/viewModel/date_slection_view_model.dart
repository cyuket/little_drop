import 'package:flutter/material.dart';
import 'base_model.dart';
import 'package:little_drops/services/item_selection_services.dart';
import 'package:little_drops/locator.dart';

class DateViewModel extends BaseModel {
  final ItemSelectionServices _itemSelectionServices =
      locator<ItemSelectionServices>();

  void updatePickupAndDeliveryTime({
    DateTime pickupDate,
    DateTime deliveryDate,
    TimeOfDay pickupTime,
    TimeOfDay deliveryTime,
  }) {
    setBusy(true);
    _itemSelectionServices.updatePickupAndDeliveryTime(
      deliveryDatee: deliveryDate,
      deliveryTimee: deliveryTime,
      pickupDatee: pickupDate,
      pickupTimee: pickupTime,
    );
    setBusy(false);
  }
}
