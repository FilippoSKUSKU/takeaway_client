import 'dart:convert';
import 'dart:io';

import 'package:takeaway_client/global.dart';
import 'package:takeaway_client/model/ordine_dto.dart';
import 'package:http/http.dart' as http;
import 'package:takeaway_client/utility/shared_pref_manager.dart';

class OrdineService {
  OrdineService._();
  static final _instance = OrdineService._();
  static OrdineService get instance => _instance;

  Future<List<OrdineDto>> fetchOrdiniUtente() async {
    String? token = await SharedPrefManager.instance.getToken();
    try {
      final response = await http.get(
        Uri.parse(kAllOrdiniUtente),
        headers:
            kHeaders
              ..putIfAbsent(HttpHeaders.authorizationHeader, () => token!),
      );
      final Iterable body = jsonDecode(response.body);
      return body.map((e) => OrdineDto.fromMap(e)).toList();
    } on Exception catch (e) {
      throw e;
    }
  }
}
