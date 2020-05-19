import 'base_model.dart';
import 'package:little_drops/services/item_selection_services.dart';
import 'package:little_drops/models/item_model.dart';
import 'package:little_drops/locator.dart';

class ItemSelectionViewModel extends BaseModel {
  final ItemSelectionServices _itemSelectionServices =
      locator<ItemSelectionServices>();

  // getting all Items
  // List<ItemModel> get items => _itemSelectionServices.items;

  // getting selected Items

  List<ItemModel> get selectedItems => _itemSelectionServices.selectedItems;

  //Adding selected Item

  void addToSelectedItemList(ItemModel item) {
    setBusy(true);
    _itemSelectionServices.addToSelectedItemList(item);
    setBusy(false);
  }

  void incrementQty(ItemModel itemModel) {
    setBusy(true);
    _itemSelectionServices.incrementQty(itemModel);
    setBusy(false);
  }

  void decrementQty(ItemModel itemModel) {
    setBusy(true);
    _itemSelectionServices.decrementQty(itemModel);
    setBusy(false);
  }
}
