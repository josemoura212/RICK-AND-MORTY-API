import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';

abstract interface class IRestClient {
  Future<dynamic> get(final String url);
}

class RestClientDio implements IRestClient {
  final client = Dio();

  @override
  Future get(final String url) async {
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('erro ao fazer a requisição ${response.statusCode}');
      }
    } on DioException {
      throw Exception();
    }
  }
}

class RestClientHttp implements IRestClient {
  final client = Client();
  @override
  Future get(final String url) async {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('erro ao fazer a requisição ${response.statusCode}');
    }
  }
}
