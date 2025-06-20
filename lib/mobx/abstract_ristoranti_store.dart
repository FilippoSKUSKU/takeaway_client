import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:takeaway_client/model/ristorante_dto.dart';
import 'package:takeaway_client/service/ristorante_service.dart';

part 'abstract_ristoranti_store.g.dart';

class Ristoranti = _Ristoranti with _$Ristoranti;

abstract class _Ristoranti with Store {
  @observable
  ObservableList<RistoranteDto> ristorantiList =
      ObservableList<RistoranteDto>();

  @observable
  ObservableList<RistoranteDto> toShow = ObservableList<RistoranteDto>();

  @observable
  bool fetchGaveError = false;
  @observable
  bool fetchIsLoading = false;
  @action
  Future<void> fetchRistorantiList() async {
    fetchIsLoading = true;
    log('fetching');
    try {
      ristorantiList = ObservableList.of(
        (await RistoranteService.instance.fetchAllRistoranti()),
      );
      fetchGaveError = false;
    } on Exception catch (e) {
      fetchGaveError = true;
      log(e.toString());
    }
    fetchIsLoading = false;
  }

  @action
  void initToShow() {
    log('init to show');
    toShow = ristorantiList;
  }

  @action
  void filterToShow(bool Function(RistoranteDto) test) {
    log('filtering restaurants');
    toShow = ObservableList.of(ristorantiList.where((e) => test(e)));
  }
}
