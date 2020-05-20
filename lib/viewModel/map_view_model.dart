import 'base_model.dart';
import 'package:little_drops/services/item_selection_services.dart';
import 'package:little_drops/locator.dart';

class MapViewModel extends BaseModel {
  final ItemSelectionServices _itemSelectionServices =
      locator<ItemSelectionServices>();

  void updatePickupAdrees(String address) {
    setBusy(false);
    _itemSelectionServices.updatePickupAdrees(address);
    setBusy(true);
  }

  void updateDeliveryAdrees(String address) {
    setBusy(false);
    _itemSelectionServices.updateDeliveryAdrees(address);
    setBusy(true);
  }
}
