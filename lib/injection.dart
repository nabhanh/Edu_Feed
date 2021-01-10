import 'package:education_feed/provider/provider.dart';
import 'package:education_feed/services/networking.dart';
import 'package:get_it/get_it.dart';

GetIt s1 = GetIt.I;
void init() {
  s1.registerLazySingleton(() => Networking());

  s1.registerLazySingleton(()=>AppProvider(
    networking: s1()
  ));
}
