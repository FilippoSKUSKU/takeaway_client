import 'package:flutter/material.dart';
import 'package:takeaway_client/model/ristorante_dto.dart';
import 'package:takeaway_client/utility/mob_stores.dart';
import 'package:takeaway_client/utility/my_utility.dart';

class RistoranteCard extends StatelessWidget {
  const RistoranteCard({
    super.key,
    required this.ristorante,
    required this.selected,
    this.onSelect,
  });
  final RistoranteDto ristorante;
  final void Function()? onSelect;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final size = MyUtility.getSize(context);
    final displayType = MyUtility.getDisplayType(context);
    return Card(
      margin: EdgeInsets.all(
        displayType == DisplayType.compact || displayType == DisplayType.medium
            ? 16
            : 24,
      ),
      child: SizedBox(
        height: size.height * 0.25,
        child: InkWell(
          onTap: onSelect,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        selected
                            ? Theme.of(context).colorScheme.inversePrimary
                            : Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      ristorante.nome,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 16,
                    children:
                        ristorante.categorie.map((e) => Text(e.nome)).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
