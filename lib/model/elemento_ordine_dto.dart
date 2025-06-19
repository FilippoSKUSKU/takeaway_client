// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ElementoOrdineDto {
  final String nome;
  final double prezzo;
  final int quantita;
  ElementoOrdineDto({
    required this.nome,
    required this.prezzo,
    required this.quantita,
  });

  ElementoOrdineDto copyWith({String? nome, double? prezzo, int? quantita}) {
    return ElementoOrdineDto(
      nome: nome ?? this.nome,
      prezzo: prezzo ?? this.prezzo,
      quantita: quantita ?? this.quantita,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'prezzo': prezzo,
      'quantita': quantita,
    };
  }

  factory ElementoOrdineDto.fromMap(Map<String, dynamic> map) {
    return ElementoOrdineDto(
      nome: map['nome'] as String,
      prezzo: map['prezzo'] as double,
      quantita: map['quantita'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ElementoOrdineDto.fromJson(String source) =>
      ElementoOrdineDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ElementoOrdineDto(nome: $nome, prezzo: $prezzo, quantita: $quantita)';

  @override
  bool operator ==(covariant ElementoOrdineDto other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.prezzo == prezzo &&
        other.quantita == quantita;
  }

  @override
  int get hashCode => nome.hashCode ^ prezzo.hashCode ^ quantita.hashCode;
}
