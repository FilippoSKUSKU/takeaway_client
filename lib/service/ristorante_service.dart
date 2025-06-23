import 'dart:convert';
import 'dart:io';

import 'package:takeaway_client/global.dart';
import 'package:takeaway_client/model/ristorante_dto.dart';
import 'package:http/http.dart' as http;

class RistoranteService {
  RistoranteService._();
  static final RistoranteService _instance = RistoranteService._();
  static RistoranteService get instance => _instance;

  Future<List<RistoranteDto>> fetchAllRistoranti() async {
    final response = await http.get(
      Uri.parse(kAllRistoranti),
      headers: kHeaders,
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        final Iterable body = jsonDecode(response.body);
        final list = body.map((e) => RistoranteDto.fromMap(e)).toList();
        list.sort((a, b) => a.nome.toLowerCase().compareTo(b.nome));
        return list;
    }
    return Future.error(response);
  }
}
