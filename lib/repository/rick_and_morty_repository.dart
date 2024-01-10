import 'package:rick_morty/model/person_model.dart';
import 'package:rick_morty/service/rest_client/rest_client.dart';

abstract class IRickAndMortyRepository {
  Future<List<PersonModel>> findAllPerson({
    required int page,
  });
  Future<List<PersonModel>> findAllBySpecies({
    required int page,
    required String species,
  });

  Future<List<PersonModel>> findByName({
    required String name,
  });
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

  @override
  Future<List<PersonModel>> findAllBySpecies({
    required int page,
    required String species,
  }) async {
    final urlSpecies =
        'https://rickandmortyapi.com/api/character/?page=$page&species=$species';
    final response = await client.get(urlSpecies);
    return response['results']
        .map<PersonModel>((personMap) => PersonModel.fromMap(personMap))
        .toList();
  }

  @override
  Future<List<PersonModel>> findByName({required String name}) async {
    final space = name.replaceAll(' ', '%20');
    final urlName = 'https://rickandmortyapi.com/api/character/?name=$space';
    final response = await client.get(urlName);

    return response['results']
        .map<PersonModel>((personMap) => PersonModel.fromMap(personMap))
        .toList();
  }
}
