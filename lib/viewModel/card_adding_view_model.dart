import 'package:flutter/material.dart';
import 'base_model.dart';
import 'package:little_drops/services/item_selection_services.dart';
import 'package:little_drops/locator.dart';

class CardAddingViewModel extends BaseModel {
  final ItemSelectionServices _itemSelectionServices =
      locator<ItemSelectionServices>();

  void updateCardDetails({String number, String date, String cvvNumber}) {
    setBusy(true);
    _itemSelectionServices.updateCardDetails(
      number: number,
      date: date,
      cvvNumber: cvvNumber,
    );
    setBusy(false);
  }
}
