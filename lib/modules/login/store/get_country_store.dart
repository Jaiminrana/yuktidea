import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:yuktidea/apibase/repository.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/services/SnackbarService.dart';
import 'package:yuktidea/values/enumerations.dart';

part 'get_country_store.g.dart';

class GetCountryStore = _GetCountryStore with _$GetCountryStore;

abstract class _GetCountryStore with Store {
  void initialize() {
    getCountryListData();
    searchController.addListener(onChanged);
  }

  final TextEditingController searchController = TextEditingController();

  @observable
  NetworkState countryState = NetworkState.idle;

  ObservableList<CountryDataResDm> countryList = ObservableList.of([]);

  @observable
  String? search;

  @computed
  bool get isSearchEmpty => search?.trim().isEmpty ?? true;

  @computed
  bool get isSearchResultEmpty =>
      searchCountry.isEmpty && countryList.isNotEmpty;

  void onChanged() => search = searchController.text.trim().toLowerCase();

  @computed
  List<CountryDataResDm> get searchCountry {
    return isSearchEmpty
        ? countryList
        : countryList.where(
            (country) {
              return country.name?.toLowerCase().contains(search!) ?? false;
            },
          ).toList();
  }

  Future<void> getCountryListData() async {
    try {
      countryState = NetworkState.loading;
      final result = await Repository.instance.getCountryData();
      final countryData = result;
      if (countryData.isEmpty) {
        throw Exception();
      }
      countryList.addAll(countryData);
      countryState = NetworkState.success;
    } catch (e) {
      countryState = NetworkState.error;
      debugPrint(e.toString());
      SnackBarService.showSnack(Str.current.errorCountry);
    }
  }
}
