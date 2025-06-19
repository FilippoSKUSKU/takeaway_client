// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:takeaway_client/model/portata_dto.dart';

class CategoriaDto {
  final int id;
  final String nome;
  final List<PortataDto> portate;
  CategoriaDto({required this.id, required this.nome, required this.portate});

  CategoriaDto copyWith({int? id, String? nome, List<PortataDto>? portate}) {
    return CategoriaDto(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      portate: portate ?? this.portate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'portate': portate.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoriaDto.fromMap(Map<String, dynamic> map) {
    return CategoriaDto(
      id: map['id'] as int,
      nome: map['nome'] as String,
      portate:
          (map['portate'] as Iterable)
              .map((e) => PortataDto.fromMap(e))
              .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaDto.fromJson(String source) =>
      CategoriaDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriaDto(id: $id, nome: $nome, portate: $portate)';

  @override
  bool operator ==(covariant CategoriaDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        listEquals(other.portate, portate);
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ portate.hashCode;
}
