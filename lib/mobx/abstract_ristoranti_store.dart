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

  @action
  Future<void> fetchRistorantiList() async {
    log('fetching');
    ristorantiList = ObservableList.of(
      (await RistoranteService.instance.fetchAllRistoranti()),
    );
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
