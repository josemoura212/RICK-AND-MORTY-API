// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class PersonModel extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  const PersonModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, status, species, gender, image];

  //! aqui estou transformando meu objeto em mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'image': image,
    };
  }

  //! aqui estou tranformando meu map no objeto personModel
  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] ?? '',
    );
  }

  //! transformo o objeto em um json
  String toJson() => jsonEncode(toMap());

  //! transformo meu objeto json em um objeto personModel;
  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(jsonDecode(source));

  @override
  String toString() {
    return 'Person(id: $id, name: $name, status: $status, species: $species, gender: $gender, image: $image)';
  }
}
