// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

// SERVICES
import 'package:notredame/core/services/navigation_service.dart';
import 'package:notredame/core/services/analytics_service.dart';
import 'package:notredame/core/services/mon_ets_api.dart';

// MANAGERS
import 'package:notredame/core/managers/user_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AnalyticsService());
  locator.registerLazySingleton(() => MonETSApi(http.Client()));
  locator.registerLazySingleton(() => const FlutterSecureStorage());

  // Managers
  locator.registerLazySingleton(() => UserRepository());
}
