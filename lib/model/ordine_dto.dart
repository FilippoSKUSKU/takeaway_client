// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:takeaway_client/model/elemento_ordine_dto.dart';

enum StatoOrdine {
  inAttesa('IN_ATTESA_DI_CONFERMA'),
  confermato('CONFERMATO'),
  rifiutato('RIFIUTATO'),
  annullato('ANNULLATO'),
  ritirato('RITIRATO');

  const StatoOrdine(this.jsonString);
  final String jsonString;

  static StatoOrdine fromString(String stato) {
    return switch (stato) {
      'CONFERMATO' => confermato,
      'RIFIUTATO' => rifiutato,
      'RITIRATO' => ritirato,
      'ANNULLATO' => annullato,
      _ => inAttesa,
    };
  }
}

class OrdineDto {
  final int id;
  final StatoOrdine statoOrdine;
  final List<ElementoOrdineDto> elementiOrdine;
  final String nomeRistorante;
  final String nomeCliente;
  final DateTime orarioDiRitiro;
  final String? note;
  final String? testoRecensione;
  final int? votoRecensione;
  OrdineDto({
    required this.id,
    required this.statoOrdine,
    required this.elementiOrdine,
    required this.nomeRistorante,
    required this.nomeCliente,
    required this.orarioDiRitiro,
    this.note,
    this.testoRecensione,
    this.votoRecensione,
  });

  OrdineDto copyWith({
    int? id,
    StatoOrdine? statoOrdine,
    List<ElementoOrdineDto>? elementiOrdine,
    String? nomeRistorante,
    String? nomeCliente,
    DateTime? orarioDiRitiro,
    String? note,
    String? testoRecensione,
    int? votoRecensione,
  }) {
    return OrdineDto(
      id: id ?? this.id,
      statoOrdine: statoOrdine ?? this.statoOrdine,
      elementiOrdine: elementiOrdine ?? this.elementiOrdine,
      nomeRistorante: nomeRistorante ?? this.nomeRistorante,
      nomeCliente: nomeCliente ?? this.nomeCliente,
      orarioDiRitiro: orarioDiRitiro ?? this.orarioDiRitiro,
      note: note ?? this.note,
      testoRecensione: testoRecensione ?? this.testoRecensione,
      votoRecensione: votoRecensione ?? this.votoRecensione,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'statoOrdine': statoOrdine.jsonString,
      'elementiOrdine': elementiOrdine.map((x) => x.toMap()).toList(),
      'nomeRistorante': nomeRistorante,
      'nomeCliente': nomeCliente,
      'orarioDiRitiro': orarioDiRitiro.millisecondsSinceEpoch,
      'note': note,
      'testoRecensione': testoRecensione,
      'votoRecensione': votoRecensione,
    };
  }

  factory OrdineDto.fromMap(Map<String, dynamic> map) {
    return OrdineDto(
      id: map['id'] as int,
      statoOrdine: StatoOrdine.fromString(map['statoOrdine']),
      elementiOrdine: List<ElementoOrdineDto>.from(
        (map['elementiOrdine'] as List<int>).map<ElementoOrdineDto>(
          (x) => ElementoOrdineDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      nomeRistorante: map['nomeRistorante'] as String,
      nomeCliente: map['nomeCliente'] as String,
      orarioDiRitiro: DateTime.fromMillisecondsSinceEpoch(
        map['orarioDiRitiro'] as int,
      ),
      note: map['note'] != null ? map['note'] as String : null,
      testoRecensione:
          map['testoRecensione'] != null
              ? map['testoRecensione'] as String
              : null,
      votoRecensione:
          map['votoRecensione'] != null ? map['votoRecensione'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdineDto.fromJson(String source) =>
      OrdineDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrdineDto(id: $id, statoOrdine: $statoOrdine, elementiOrdine: $elementiOrdine, nomeRistorante: $nomeRistorante, nomeCliente: $nomeCliente, orarioDiRitiro: $orarioDiRitiro, note: $note, testoRecensione: $testoRecensione, votoRecensione: $votoRecensione)';
  }

  @override
  bool operator ==(covariant OrdineDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.statoOrdine == statoOrdine &&
        listEquals(other.elementiOrdine, elementiOrdine) &&
        other.nomeRistorante == nomeRistorante &&
        other.nomeCliente == nomeCliente &&
        other.orarioDiRitiro == orarioDiRitiro &&
        other.note == note &&
        other.testoRecensione == testoRecensione &&
        other.votoRecensione == votoRecensione;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        statoOrdine.hashCode ^
        elementiOrdine.hashCode ^
        nomeRistorante.hashCode ^
        nomeCliente.hashCode ^
        orarioDiRitiro.hashCode ^
        note.hashCode ^
        testoRecensione.hashCode ^
        votoRecensione.hashCode;
  }
}
// nomeRistorante
// string
// nomeCliente
// string
// orarioDiRitiro
// stringdate-time
// array<object>
// string
// note
// string
// testoRecensione
// string
// votoRecensione
// integerint32