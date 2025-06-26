import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:takeaway_client/model/insert_elemento_ordine_dto.dart';
import 'package:takeaway_client/model/portata_dto.dart';
import 'package:takeaway_client/utility/mob_stores.dart';

class PortataDetail extends StatelessWidget {
  const PortataDetail({super.key, required this.portataDto});
  final PortataDto portataDto;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: Theme.of(context).colorScheme.inversePrimary,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LayoutBuilder(
              builder:
                  (_, c) => Row(
                    children: [
                      SizedBox(
                        width: c.maxWidth * 0.7,
                        child: Text(
                          portataDto.nome,
                          style: textTheme.titleLarge,
                          softWrap: true,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${portataDto.prezzo.toStringAsFixed(2)}€',
                        style: textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
            ),
            Divider(color: Theme.of(context).colorScheme.onPrimary),
            if (portataDto.descrizione != null)
              Text(portataDto.descrizione!, style: textTheme.bodyLarge),
            Spacer(),
            Row(
              children: [
                Observer(
                  builder:
                      (_) => RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'quantità: ',
                              style: textTheme.labelLarge!,
                            ),
                            TextSpan(
                              text:
                                  kOrdineStore
                                              .elementiOrdineCorrenteMap
                                              .isEmpty ||
                                          !kOrdineStore
                                              .elementiOrdineCorrenteMap
                                              .containsKey(portataDto.id)
                                      ? '0'
                                      : kOrdineStore
                                          .elementiOrdineCorrenteMap[portataDto
                                              .id]
                                          .toString(),
                              style: Theme.of(context).textTheme.labelLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                ),
                Spacer(),
                IconButton(onPressed: rimuoviPortata, icon: Icon(Icons.remove)),
                IconButton(onPressed: aggiungiPortata, icon: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void aggiungiPortata() {
    kOrdineStore.aggiungiElemento(portataDto.id);
  }

  void rimuoviPortata() {
    kOrdineStore.rimuoviElemento(portataDto.id);
  }
}
