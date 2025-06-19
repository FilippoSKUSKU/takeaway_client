import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:takeaway_client/global.dart';
import 'package:takeaway_client/model/insert_user_dto.dart';
import 'package:takeaway_client/model/login_dto.dart';
import 'package:takeaway_client/utility/shared_pref_manager.dart';

class OnBoardingService {
  OnBoardingService._();
  static final _instance = OnBoardingService._();
  static OnBoardingService get instance => _instance;

  Future<http.Response> registerUser(InsertUserDto dto) {
    try {
      return http.post(
        Uri.parse(kRegisterUser),
        body: dto.toJson(),
        headers: kHeaders,
      );
    } on Exception catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }

  Future<void> loginUser(LoginDto dto) async {
    try {
      final response = await http.post(
        Uri.parse(kLoginUser),
        headers: kHeaders,
        body: dto.toJson(),
      );
      //     .then((response) {
      //     });
      switch (response.statusCode) {
        case HttpStatus.ok:
          if (response.headers.containsKey(HttpHeaders.authorizationHeader)) {
            await SharedPrefManager.instance.saveToken(
              'Bearer ${response.headers[HttpHeaders.authorizationHeader]!}',
            );
          }
          break;
      }
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
