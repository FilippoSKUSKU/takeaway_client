import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:takeaway_client/model/ristorante_dto.dart';
import 'package:takeaway_client/ui/widgets/ristorante_card.dart';
import 'package:takeaway_client/ui/widgets/ristorante_detail.dart';
import 'package:takeaway_client/ui/widgets/large_screen_body.dart';
import 'package:takeaway_client/utility/mob_stores.dart';
import 'package:takeaway_client/utility/my_utility.dart';

class UserRestaurantListPage extends StatefulWidget {
  const UserRestaurantListPage({super.key});

  @override
  State<UserRestaurantListPage> createState() => _UserRestaurantListPageState();
}

class _UserRestaurantListPageState extends State<UserRestaurantListPage> {
  final searchController = SearchController();
  RistoranteDto? selected;
  @override
  void initState() {
    _fetchAndInit();
    searchController.addListener(
      () => kRistorantiStore.filterToShow(
        (e) =>
            e.nome.toLowerCase().contains(
              searchController.text.toLowerCase(),
            ) ||
            e.categorie.any(
              (c) => c.nome.toLowerCase().contains(searchController.text),
            ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MyUtility.getSize(context);
    final displayType = MyUtility.getDisplayType(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Takeaway',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: LargeScreenBody(
        largePaneBody: [
          selected == null
              ? Center(child: Text('seleziona un ristorante'))
              : Expanded(child: RistoranteDetail(ristorante: selected!)),
        ],
        smallPaneBody: [
          Text('Cerca il tuo ristorante preferito'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon:
                    searchController.text.isEmpty
                        ? null
                        : IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed: searchController.clear,
                          icon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: searchController.clear,
                          ),
                        ),
                icon: Icon(Icons.search),
                hintText: 'cerca un ristorante o una categoria',
                labelText: 'nome ristorante/categoria',
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder:
                  (_) => ListView.builder(
                    itemBuilder:
                        (c, i) => RistoranteCard(
                          onSelect:
                              () => setState(
                                () => selected = kRistorantiStore.toShow[i],
                              ),
                          selected:
                              selected?.id == kRistorantiStore.toShow[i].id,
                          ristorante: kRistorantiStore.toShow[i],
                        ),
                    itemCount: kRistorantiStore.toShow.length,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void _fetchAndInit() async {
    await kRistorantiStore.fetchRistorantiList();
    kRistorantiStore.initToShow();
  }
}
