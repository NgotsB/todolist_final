import 'package:get_it/get_it.dart';

import 'app/storage/local_storage.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LocalStorage());
}