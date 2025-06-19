// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:takeaway_client/model/categoria_dto.dart';

class RistoranteDto {
  final String nome;
  final int id;
  final List<CategoriaDto> categorie;
  RistoranteDto({
    required this.nome,
    required this.id,
    required this.categorie,
  });

  RistoranteDto copyWith({
    String? nome,
    int? id,
    List<CategoriaDto>? categorie,
  }) {
    return RistoranteDto(
      nome: nome ?? this.nome,
      id: id ?? this.id,
      categorie: categorie ?? this.categorie,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'id': id,
      'categorie': categorie.map((x) => x.toMap()).toList(),
    };
  }

  factory RistoranteDto.fromMap(Map<String, dynamic> map) {
    return RistoranteDto(
      nome: map['nome'] as String,
      id: map['id'] as int,
      categorie:
          (map['categorie'] as Iterable)
              .map((e) => CategoriaDto.fromMap(e))
              .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RistoranteDto.fromJson(String source) =>
      RistoranteDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RistoranteDto(nome: $nome, id: $id, categorie: $categorie)';

  @override
  bool operator ==(covariant RistoranteDto other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.id == id &&
        listEquals(other.categorie, categorie);
  }

  @override
  int get hashCode => nome.hashCode ^ id.hashCode ^ categorie.hashCode;
}
