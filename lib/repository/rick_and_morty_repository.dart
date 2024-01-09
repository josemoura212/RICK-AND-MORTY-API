import 'package:rick_morty/model/person_model.dart';
import 'package:rick_morty/service/rest_client/rest_client.dart';

abstract class IRickAndMortyRepository {
  Future<List<PersonModel>> findAllPerson({required int page});
}

class RickAndMortyRepository implements IRickAndMortyRepository {
  final IRestClient client;

  RickAndMortyRepository({required this.client});

  @override
  Future<List<PersonModel>> findAllPerson({required int page}) async {
    final url = 'https://rickandmortyapi.com/api/character/?page=$page';
    final response = await client.get(url);
    return response['results']
        .map<PersonModel>((personMap) => PersonModel.fromMap(personMap))
        .toList();
  }
}
