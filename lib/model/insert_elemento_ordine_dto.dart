// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobx/mobx.dart';

class InsertElementoOrdineDto {
  int idPortata;
  @observable
  int quantita;
  InsertElementoOrdineDto({required this.idPortata, required this.quantita});

  InsertElementoOrdineDto copyWith({int? idPortata, int? quantita}) {
    return InsertElementoOrdineDto(
      idPortata: idPortata ?? this.idPortata,
      quantita: quantita ?? this.quantita,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'idPortata': idPortata, 'quantita': quantita};
  }

  factory InsertElementoOrdineDto.fromMap(Map<String, dynamic> map) {
    return InsertElementoOrdineDto(
      idPortata: map['idPortata'] as int,
      quantita: map['quantita'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory InsertElementoOrdineDto.fromJson(String source) =>
      InsertElementoOrdineDto.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'InsertElementoOrdineDto(idPortata: $idPortata, quantita: $quantita)';

  @override
  bool operator ==(covariant InsertElementoOrdineDto other) {
    if (identical(this, other)) return true;

    return other.idPortata == idPortata && other.quantita == quantita;
  }

  @override
  int get hashCode => idPortata.hashCode ^ quantita.hashCode;
}
