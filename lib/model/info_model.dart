// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class InfoModel extends Equatable {
  final int count;
  final int pages;
  final String next;

  const InfoModel({
    required this.count,
    required this.pages,
    required this.next,
  });
  @override
  List<Object?> get props => [count, pages, next];

  //aqui estou transformando meu objeto em mapa
  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
    };
  }

  // qui estou tranformando meu map no objeto infoModel
  factory InfoModel.fromMap(Map<String, dynamic> map) {
    return InfoModel(
      count: map['count'] ?? 0,
      pages: map['pages'] ?? 0,
      next: map['next'] ?? '',
    );
  }
  // transformo o objeto em um json
  String toJson() => jsonEncode(toMap());

  // transformo meu objeto json em um objeto infoModel;
  factory InfoModel.fromJson(String source) =>
      InfoModel.fromMap(jsonDecode(source));

  @override
  String toString() {
    return 'Info(count: $count, pages: $pages, next: $next)';
  }
}
