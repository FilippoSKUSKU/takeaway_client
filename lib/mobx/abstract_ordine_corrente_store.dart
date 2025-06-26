import 'package:mobx/mobx.dart';
import 'package:takeaway_client/model/insert_elemento_ordine_dto.dart';

part 'abstract_ordine_corrente_store.g.dart';

class OrdineCorrente = _OrdineCorrente with _$OrdineCorrente;

abstract class _OrdineCorrente with Store {
  @observable
  ObservableMap<int, int> elementiOrdineCorrenteMap = ObservableMap();

  @action
  void aggiungiElemento(int portataId) {
    if (!elementiOrdineCorrenteMap.containsKey(portataId)) {
      elementiOrdineCorrenteMap.putIfAbsent(portataId, () => 1);
      return;
    }
    elementiOrdineCorrenteMap.update(portataId, (e) => ++e);
  }

  @action
  void rimuoviElemento(int portataId) {
    if (elementiOrdineCorrenteMap.containsKey(portataId) &&
        elementiOrdineCorrenteMap[portataId] == 1) {
      elementiOrdineCorrenteMap.remove(portataId);
      return;
    }
    elementiOrdineCorrenteMap.update(portataId, (e) => --e);
  }
}
