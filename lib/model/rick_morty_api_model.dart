// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:rick_morty/model/info_model.dart';
import 'package:rick_morty/model/person_model.dart';

class RickMortyApiModel extends Equatable {
  final InfoModel info;
  final List<PersonModel> results;

  const RickMortyApiModel({required this.info, required this.results});
  @override
  List<Object?> get props => [info, results];

  //aqui estou transformando meu objeto em mapa
  Map<String, dynamic> toMap() {
    return {
      'info': info.toMap(),
      'results': results.map((person) => person.toMap()).toList(),
    };
  }

  // aqui estou tranformando meu map no objeto apiModel

  factory RickMortyApiModel.fromMap(Map<String, dynamic> map) {
    return RickMortyApiModel(
      info: InfoModel.fromMap(map['info'] ?? <String, dynamic>{}),
      results: map['results']
              ?.map<PersonModel>((personMap) => PersonModel.fromMap(map))
              .toList() ??
          <PersonModel>[],
    );
  }

  // transformo o objeto em um json
  String toJson() => jsonEncode(toMap());

  // transformo meu objeto json em um objeto apiModel;
  factory RickMortyApiModel.fromJson(String json) {
    return RickMortyApiModel.fromMap(jsonDecode(json));
  }

  @override
  String toString() => 'ApiModel(info: $info, results: $results)';
}
