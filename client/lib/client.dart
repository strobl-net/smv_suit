import 'package:client/services/api/api.dart';
import 'package:client/services/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void initClient() async {
  await Hive.initFlutter();
  final box = await Hive.openBox<Map<String, dynamic>>('graphql');
  await box.clear();
  final store = HiveStore(box);
  final cache = Cache(store: store);
  // TODO configure this via file & http -> https
  final link = HttpLink('http://localhost:8000/graphql');

  final client = Client(
    link: link,
    cache: cache,
  );
  
  GetIt.I.registerLazySingleton(() => client);
}

void setup() async {
  initClient();
  GetIt.I.registerLazySingleton(() => NavigationService());
  GetIt.I.registerLazySingleton(() => API());
}