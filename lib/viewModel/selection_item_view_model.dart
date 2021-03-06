import 'base_model.dart';
import 'package:little_drops/services/item_selection_services.dart';
import 'package:little_drops/models/item_model.dart';
import 'package:little_drops/locator.dart';

class ItemSelectionViewModel extends BaseModel {
  final ItemSelectionServices _itemSelectionServices =
      locator<ItemSelectionServices>();

  // getting selected Items

  List<ItemModel> get selectedItems => _itemSelectionServices.selectedItems;

  double get amount => _itemSelectionServices.selectedTotal;
  double get totalAmount => _itemSelectionServices.totalAmount;
  double get deliveryAmount => _itemSelectionServices.deliveryAmount;

  //Adding selected Item

  void addToSelectedItemList(ItemModel item) {
    setBusy(true);
    _itemSelectionServices.addToSelectedItemList(item);
    setBusy(false);
  }

  void removeSelectedItem(ItemModel item) {
    setBusy(true);
    _itemSelectionServices.removeFromSelectedItemList(item);
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
