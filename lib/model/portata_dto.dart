// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PortataDto {
  final int id;
  final String nome;
  final double prezzo;
  final String? descrizione;
  PortataDto({
    required this.id,
    required this.nome,
    required this.prezzo,
    this.descrizione,
  });

  PortataDto copyWith({
    int? id,
    String? nome,
    double? prezzo,
    String? descrizione,
  }) {
    return PortataDto(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      prezzo: prezzo ?? this.prezzo,
      descrizione: descrizione ?? this.descrizione,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'prezzo': prezzo,
      'descrizione': descrizione,
    };
  }

  factory PortataDto.fromMap(Map<String, dynamic> map) {
    return PortataDto(
      id: map['id'] as int,
      nome: map['nome'] as String,
      prezzo: map['prezzo'] as double,
      descrizione:
          map['descrizione'] != null ? map['descrizione'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PortataDto.fromJson(String source) =>
      PortataDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PortataDto(id: $id, nome: $nome, prezzo: $prezzo, descrizione: $descrizione)';
  }

  @override
  bool operator ==(covariant PortataDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.prezzo == prezzo &&
        other.descrizione == descrizione;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nome.hashCode ^ prezzo.hashCode ^ descrizione.hashCode;
  }
}
// integerint64
// nome
// string
// prezzo
// numberdouble
// descrizione
// string