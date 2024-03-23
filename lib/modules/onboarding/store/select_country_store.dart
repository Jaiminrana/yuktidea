import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:yuktidea/apibase/repository.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/model/select_country/select_country_dm.dart';
import 'package:yuktidea/model/study_country/study_country_req_dm.dart';
import 'package:yuktidea/services/SnackbarService.dart';
import 'package:yuktidea/values/enumerations.dart';

part 'select_country_store.g.dart';

class SelectCountryStore = _SelectCountryStore with _$SelectCountryStore;

abstract class _SelectCountryStore with Store {
  void init() {
    _getSelectCountryData();
  }

  @observable
  NetworkState countryState = NetworkState.idle;

  @observable
  NetworkState studyCountryState = NetworkState.idle;

  @observable
  int selectedCountry = -1;

  ObservableList<CountryDm> countryList = ObservableList.of([]);

  @action
  void onSelectCountryTap(int index) {
    selectedCountry = index;
  }

  Future<void> _getSelectCountryData() async {
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
      SnackBarService.showSnack(Str.current.errorCountry);
    }
  }

  Future<String?> setSelectedCountryForStudy() async {
    final countryId = countryList[selectedCountry].id;
    if (countryId == null) {
      SnackBarService.showSnack(Str.current.somethingWentWrong);
      return null;
    }
    try {
      studyCountryState = NetworkState.loading;
      final result = await Repository.instance.setSelectedCountryForStudy(
        studyCountryReqDm: StudyCountryReqDm(
          countryId: countryId,
        ),
      );
      SnackBarService.showSnack(result.message.toString());
      studyCountryState = NetworkState.success;
      return result.message;
    } catch (e) {
      studyCountryState = NetworkState.error;
      debugPrint(e.toString());
      SnackBarService.showSnack(e.toString());
      return null;
    }
  }
}
