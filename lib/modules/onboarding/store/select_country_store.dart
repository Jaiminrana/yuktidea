import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:yuktidea/apibase/repository.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/model/select_country/select_country_dm.dart';
import 'package:yuktidea/services/SnackbarService.dart';
import 'package:yuktidea/values/enumerations.dart';

part 'select_country_store.g.dart';

class SelectCountryStore = _SelectCountryStore with _$SelectCountryStore;

abstract class _SelectCountryStore with Store {
  @observable
  NetworkState countryState = NetworkState.idle;

  @observable
  int selectedCountry = -1;

  ObservableList<CountryDm> countryList = ObservableList.of([]);

  @action
  void onSelectCountryTap(int index) {
    selectedCountry = index;
  }

  Future<void> getSelectCountryData() async {
    try {
      countryState = NetworkState.loading;
      final result = await Repository.instance.getSelectCountryData();
      final countryData = result.countries;
      if (countryData?.isEmpty ?? true) {
        throw Exception();
      }

      countryList.addAll(countryData!);
      countryState = NetworkState.success;
    } catch (e) {
      countryState = NetworkState.error;
      debugPrint(e.toString());
      SnackbarService.showSnack(Str.current.errorCountry);
    }
  }
}
