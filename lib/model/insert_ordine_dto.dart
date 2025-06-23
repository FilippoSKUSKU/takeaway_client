// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:takeaway_client/model/insert_elemento_ordine_dto.dart';

class InsertOrdineDto {
  int idRistorante;
  List<InsertElementoOrdineDto> elementiOrdine;
  DateTime? orarioDiRitiro;
  String? note;
  InsertOrdineDto({
    required this.idRistorante,
    required this.elementiOrdine,
    this.orarioDiRitiro,
    this.note,
  });


  InsertOrdineDto copyWith({
    int? idRistorante,
    List<InsertElementoOrdineDto>? elementiOrdine,
    DateTime? orarioDiRitiro,
    String? note,
  }) {
    return InsertOrdineDto(
      idRistorante: idRistorante ?? this.idRistorante,
      elementiOrdine: elementiOrdine ?? this.elementiOrdine,
      orarioDiRitiro: orarioDiRitiro ?? this.orarioDiRitiro,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idRistorante': idRistorante,
      'elementiOrdine': elementiOrdine.map((x) => x.toMap()).toList(),
      'orarioDiRitiro': orarioDiRitiro?.millisecondsSinceEpoch,
      'note': note,
    };
  }

  factory InsertOrdineDto.fromMap(Map<String, dynamic> map) {
    return InsertOrdineDto(
      idRistorante: map['idRistorante'] as int,
      elementiOrdine: List<InsertElementoOrdineDto>.from((map['elementiOrdine'] as List<int>).map<InsertElementoOrdineDto>((x) => InsertElementoOrdineDto.fromMap(x as Map<String,dynamic>),),),
      orarioDiRitiro: map['orarioDiRitiro'] != null ? DateTime.fromMillisecondsSinceEpoch(map['orarioDiRitiro'] as int) : null,
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InsertOrdineDto.fromJson(String source) => InsertOrdineDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InsertOrdineDto(idRistorante: $idRistorante, elementiOrdine: $elementiOrdine, orarioDiRitiro: $orarioDiRitiro, note: $note)';
  }

  @override
  bool operator ==(covariant InsertOrdineDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.idRistorante == idRistorante &&
      listEquals(other.elementiOrdine, elementiOrdine) &&
      other.orarioDiRitiro == orarioDiRitiro &&
      other.note == note;
  }

  @override
  int get hashCode {
    return idRistorante.hashCode ^
      elementiOrdine.hashCode ^
      orarioDiRitiro.hashCode ^
      note.hashCode;
  }
}
