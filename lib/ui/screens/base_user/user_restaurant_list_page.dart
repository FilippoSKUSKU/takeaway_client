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
      floatingActionButton: Observer(
        builder: (_) {
          int count = 0;
          for (int a in kOrdineStore.elementiOrdineCorrenteMap.values) {
            count += a;
          }
          return FloatingActionButton(
            onPressed:
                kOrdineStore.elementiOrdineCorrenteMap.isEmpty ? null : () {},
            child: Badge(
              isLabelVisible: kOrdineStore.elementiOrdineCorrenteMap.isNotEmpty,
              offset: Offset(15, -15),
              label: Text('$count'),
              child: Icon(Icons.dinner_dining),
            ),
          );
        },
      ),
      appBar: AppBar(
        shadowColor: Theme.of(context).shadowColor,
        elevation: 5,
        title: Text(
          'Takeaway',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Observer(
        builder:
            (_) => LargeScreenBody(
              largePaneBody: [
                Expanded(
                  child:
                      kRistorantiStore.fetchIsLoading
                          ? Center(child: CircularProgressIndicator())
                          : kRistorantiStore.fetchGaveError
                          ? Center(
                            child: TextButton.icon(
                              label: const Text('errore nel caricamento'),
                              onPressed: _fetchAndInit,
                              icon: Icon(Icons.replay_outlined),
                            ),
                          )
                          : selected != null
                          ? RistoranteDetail(ristorante: selected!)
                          : Center(
                            child: Text(
                              'seleziona un ristorante',
                              textAlign: TextAlign.center,
                            ),
                          ),
                ),
              ],
              smallPaneBody: [
                Text('Cerca il tuo ristorante preferito'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: searchController.clear,
                        icon: Icon(Icons.clear),
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
                                      () =>
                                          selected = kRistorantiStore.toShow[i],
                                    ),
                                selected:
                                    selected?.id ==
                                    kRistorantiStore.toShow[i].id,
                                ristorante: kRistorantiStore.toShow[i],
                              ),
                          itemCount: kRistorantiStore.toShow.length,
                        ),
                  ),
                ),
              ],
            ),
      ),
    );
  }

  void _fetchAndInit() async {
    await kRistorantiStore.fetchRistorantiList();
    kRistorantiStore.initToShow();
  }
}
