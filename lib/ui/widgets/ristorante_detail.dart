import 'package:flutter/material.dart';
import 'package:takeaway_client/model/ristorante_dto.dart';
import 'package:takeaway_client/ui/widgets/categoria_detail.dart';
import 'package:takeaway_client/utility/my_utility.dart';

class RistoranteDetail extends StatelessWidget {
  RistoranteDetail({super.key, required this.ristorante});
  final RistoranteDto ristorante;

  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final size = MyUtility.getSize(context);
    return Column(
      children: [
        Text(
          ristorante.nome,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          direction: Axis.horizontal,
          children:
              ristorante.categorie
                  .map(
                    (e) => OutlinedButton(
                      onPressed:
                          () => controller.animateTo(
                            ristorante.categorie.indexOf(e)*size.height * 0.9,
                            duration: Durations.short4,
                            curve: Curves.easeIn,
                          ),
                      child: Text(e.nome),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            controller: controller,
            itemCount: ristorante.categorie.length,
            itemBuilder:
                (_, i) => CategoriaDetail(
                  categoria: ristorante.categorie[i],
                  heigth: size.height * 0.9,
                ),
          ),
        ),
      ],
    );
  }
}
