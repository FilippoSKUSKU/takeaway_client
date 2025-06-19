import 'dart:io';

//PATHS
const kBaseUrl = 'http://localhost:8080/';
const kRegisterUser = '${kBaseUrl}all/utente/registra';
const kLoginUser = '${kBaseUrl}all/utente/login';
const kAllRistoranti = '${kBaseUrl}all/ristoranti';
const Map<String, String> kHeaders = <String, String>{
  HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
  // HttpHeaders.accessControlAllowOriginHeader: '*',
  // HttpHeaders.allowHeader:
  // '${HttpHeaders.accessControlAllowOriginHeader}, Accept',
  // HttpHeaders.acceptHeader: '*/*',
};
