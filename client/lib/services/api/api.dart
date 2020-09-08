import 'package:client/graphql/persons/all_persons_complete.req.gql.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';

class API {
  final _client = GetIt.I<Client>();

  void getPersons() {
    final personsRequest = GAllPersonsCompleteReq();
    _client.responseStream(personsRequest).listen((response) => print(response));
  }
}