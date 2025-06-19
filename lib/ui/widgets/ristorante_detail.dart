import 'package:flutter/material.dart';
import 'package:takeaway_client/model/ristorante_dto.dart';

class RistoranteDetail extends StatelessWidget {
  const RistoranteDetail({super.key, required this.ristorante});
  final RistoranteDto ristorante;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ristorante.nome,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: ristorante.categorie.length,
            itemBuilder: (_, i) => Text(ristorante.categorie[i].nome),
          ),
        ),
      ],
    );
  }
}
