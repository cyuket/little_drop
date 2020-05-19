import 'package:little_drops/models/services_model.dart';
import 'package:little_drops/locator.dart';
import 'base_model.dart';
import 'package:little_drops/services/item_selection_services.dart';

class HomeViewModel extends BaseModel {
  final ItemSelectionServices _itemSelectionServices =
      locator<ItemSelectionServices>();
  List<ServiceModel> get services => _itemSelectionServices.services;
}
