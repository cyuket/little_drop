import 'dart:collection';

import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/models/item_model.dart';

class ItemSelectionServices {
  // Items
  List<ItemModel> _item = [
    ItemModel(
      iconUrl: AppAsset().shirt,
      title: "Shirt",
      washingAndIronningPrice: 200,
      washingPrice: 100,
      ironningPrice: 100,
    ),
    ItemModel(
      iconUrl: AppAsset().trouser,
      title: "Trouser",
      washingAndIronningPrice: 200,
      washingPrice: 100,
      ironningPrice: 100,
    ),
    ItemModel(
      iconUrl: AppAsset().shoe,
      title: "Shoe",
      washingAndIronningPrice: 200,
      washingPrice: 100,
      ironningPrice: 100,
    ),
    ItemModel(
      iconUrl: AppAsset().blanket,
      title: "Blanket",
      washingAndIronningPrice: 200,
      washingPrice: 100,
      ironningPrice: 100,
    ),
    ItemModel(
      iconUrl: AppAsset().suit,
      title: "Suit",
      washingAndIronningPrice: 200,
      washingPrice: 100,
      ironningPrice: 100,
    ),
    ItemModel(
      iconUrl: AppAsset().jacket,
      title: "Jacket",
      washingAndIronningPrice: 200,
      washingPrice: 100,
      ironningPrice: 100,
    ),
  ];
  UnmodifiableListView<ItemModel> get items {
    return UnmodifiableListView(_item);
  }

  // selected item list

  List<ItemModel> _selectedItems = [];

  UnmodifiableListView<ItemModel> get selectedItems {
    return UnmodifiableListView(_selectedItems);
  }

  // adding up selected items
  void addToSelectedItemList(ItemModel item) {
    _selectedItems.add(item);
  }

//incrementing quantity
  void incrementQty(ItemModel itemModel) {
    itemModel.incrementQty();
  }

//decrementing quantity
  void decrementQty(ItemModel itemModel) {
    itemModel.decrementQty();
  }
}
