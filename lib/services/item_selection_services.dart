import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/models/item_model.dart';
import 'package:little_drops/models/services_model.dart';

enum Services {
  washAndIron,
  dryCleanning,
  iron,
  homeService,
}

class ItemSelectionServices {
  List<ServiceModel> _services = [
    ServiceModel(
      title: "Wash And Iron",
      iconImage: AppAsset().washingAndIron,
      items: _washAndIron,
      selectedItem: [],
      serviceType: ServiceType.washAndIron,
    ),
    ServiceModel(
      title: "Iron",
      iconImage: AppAsset().ironing,
      items: _iron,
      selectedItem: [],
      serviceType: ServiceType.iron,
    ),
    ServiceModel(
      title: "Dry Cleaning",
      iconImage: AppAsset().dryClean,
      items: _dryCleaning,
      serviceType: ServiceType.dryCleanning,
      selectedItem: [],
    ),
  ];

  UnmodifiableListView<ServiceModel> get services {
    return UnmodifiableListView(_services);
  }

  // selected item list
  List<ItemModel> _selectedItems = [];
  double _amount = 0;
  double _totalAmount = 0;
  double _delivery = 1000;
  double get selectedTotal {
    for (var item in _selectedItems) {
      _amount = _amount + item.totalPrice;
    }
    return _amount;
  }

  double get totalAmount {
    _totalAmount = _amount + _delivery;
    return _totalAmount;
  }

  double get deliveryAmount => _delivery;

  UnmodifiableListView<ItemModel> get selectedItems {
    return UnmodifiableListView(_selectedItems);
  }

  // adding up selected items
  void addToSelectedItemList(ItemModel item) {
    _selectedItems.add(item);
  }

  void removeFromSelectedItemList(ItemModel item) {
    _selectedItems.remove(item);
  }

//incrementing quantity
  void incrementQty(ItemModel itemModel) {
    itemModel.incrementQty();
  }

//decrementing quantity
  void decrementQty(ItemModel itemModel) {
    itemModel.decrementQty();
  }

  // handling submission of order

  String _pickUpAdress, _deliveryAdress;
  DateTime _pickupDate, _deliveryDate;
  TimeOfDay _pickupTime, _deliveryTime;
  String _cardNumber, _expiryDate, _cvv;
  String _paymentMethod;

//handleing gettters for variables

  String get pickupAdress => _pickUpAdress;
  String get deliveryAdress => _deliveryAdress;
  DateTime get pickUpDate => _pickupDate;
  DateTime get deliveryDate => _deliveryDate;
  TimeOfDay get pickUpTime => _pickupTime;
  TimeOfDay get deliveryTime => _deliveryTime;

  void updatePickupAdrees(String address) {
    _pickUpAdress = address;
  }

  void updateDeliveryAdrees(String address) {
    _deliveryAdress = address;
  }

  void updatePickupAndDeliveryTime({
    DateTime pickupDatee,
    DateTime deliveryDatee,
    TimeOfDay pickupTimee,
    TimeOfDay deliveryTimee,
  }) {
    _pickupTime = pickupTimee;
    _pickupDate = pickupDatee;
    _deliveryDate = deliveryDatee;
    _deliveryTime = deliveryTimee;
  }

  void updateCardDetails({String number, String date, String cvvNumber}) {
    _cardNumber = number;
    _expiryDate = date;
    _cvv = cvvNumber;
  }
}

// List of Items  that can be watched
List<ItemModel> _washAndIron = [
  ItemModel(
      iconUrl: AppAsset().shirt,
      title: "Shirt",
      pricePerItem: 200,
      totalPrice: 200),
  ItemModel(
      iconUrl: AppAsset().trouser,
      title: "Trouser",
      pricePerItem: 200,
      totalPrice: 200),
  ItemModel(
      iconUrl: AppAsset().blanket,
      title: "Blanket",
      pricePerItem: 500,
      totalPrice: 500),
  ItemModel(
      iconUrl: AppAsset().suit,
      title: "Suit",
      pricePerItem: 400,
      totalPrice: 400),
  ItemModel(
      iconUrl: AppAsset().jacket,
      title: "Jacket",
      pricePerItem: 300,
      totalPrice: 300),
];

// items for
List<ItemModel> _iron = [
  ItemModel(
      iconUrl: AppAsset().shirt,
      title: "Shirt",
      pricePerItem: 100,
      totalPrice: 100),
  ItemModel(
      iconUrl: AppAsset().trouser,
      title: "Trouser",
      pricePerItem: 100,
      totalPrice: 100),
  ItemModel(
      iconUrl: AppAsset().suit,
      title: "Suit",
      pricePerItem: 200,
      totalPrice: 200),
  ItemModel(
      iconUrl: AppAsset().jacket,
      title: "Jacket",
      pricePerItem: 150,
      totalPrice: 150),
];
// items for
List<ItemModel> _dryCleaning = [
  ItemModel(
      iconUrl: AppAsset().shoe,
      title: "Shoe",
      pricePerItem: 300,
      totalPrice: 300),
  ItemModel(
      iconUrl: AppAsset().blanket,
      title: "Carpet",
      pricePerItem: 1000,
      totalPrice: 1000),
];
