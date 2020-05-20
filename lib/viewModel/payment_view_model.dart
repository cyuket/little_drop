import 'base_model.dart';
import 'package:little_drops/services/item_selection_services.dart';
import 'package:little_drops/locator.dart';

class PaymentViewModel extends BaseModel {
  final ItemSelectionServices _itemSelectionServices =
      locator<ItemSelectionServices>();

  void updatePaymethod(String paymentMethod) {
    setBusy(true);
    _itemSelectionServices.updatePaymethod(paymentMethod);
    setBusy(false);
  }
}
