import 'package:flutter/material.dart';
import 'package:takeaway_client/model/portata_dto.dart';

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
                Text(
                  'quantità',
                  style: textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_rounded,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
