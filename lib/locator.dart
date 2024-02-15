import 'package:get_it/get_it.dart';
import 'package:kelvins_screen/screens/pickup_and_delivery/presentation/providers/shipment_provider.dart';

final locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => ShipmentProvider());
}