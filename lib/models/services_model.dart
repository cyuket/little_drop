import 'package:flutter/foundation.dart';
import 'package:little_drops/models/item_model.dart';

class ServiceModel {
  final String title, iconImage;
  List<ItemModel> items, selectedItem;
  int totalAmount;
  final ServiceType serviceType;

  ServiceModel(
      {@required this.title,
      @required this.iconImage,
      @required this.items,
      this.selectedItem,
      this.totalAmount,
      @required this.serviceType});

  void addSelectedItem(ItemModel item) {
    selectedItem.add(item);
  }
}

enum ServiceType { washAndIron, iron, homeService, dryCleanning }
