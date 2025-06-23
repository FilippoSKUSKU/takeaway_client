import 'package:flutter/material.dart';
import 'package:takeaway_client/model/categoria_dto.dart';
import 'package:takeaway_client/ui/widgets/portata_detail.dart';
import 'package:takeaway_client/utility/my_utility.dart';

class CategoriaDetail extends StatelessWidget {
  const CategoriaDetail({
    super.key,
    required this.categoria,
    required this.heigth,
  });
  final CategoriaDto categoria;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    final display = MyUtility.getDisplayType(context);
    return SizedBox(
      height: heigth,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                categoria.nome,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Divider(),
              Expanded(
                child: GridView.builder(
                  itemCount: categoria.portate.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        display == DisplayType.large ||
                                display == DisplayType.extraLarge
                            ? 4
                            : 3,
                  ),
                  itemBuilder:
                      (_, i) => PortataDetail(portataDto: categoria.portate[i]),
                ),
                // child: ListView.separated(
                //   separatorBuilder: (context, index) => Divider(),
                //   itemCount: categoria.portate.length,
                //   itemBuilder: (_, i) {
                //     final portata = categoria.portate[i];
                //     return PortataDetail(portataDto: portata);
                //   },
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
