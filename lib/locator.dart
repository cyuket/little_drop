import 'package:get_it/get_it.dart';
import 'package:little_drops/viewModel/selection_item_view_model.dart';
import 'services/authentication_service.dart';
import 'services/dialog_service.dart';
import 'services/firestore_service.dart';
import 'services/navigation_service.dart';
import 'services/item_selection_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => ItemSelectionServices());
}
