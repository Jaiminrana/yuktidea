import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:yuktidea/apibase/repository.dart';
import 'package:yuktidea/values/enumerations.dart';

part 'welcome_store.g.dart';

class WelcomeStore = _WelcomeStore with _$WelcomeStore;

abstract class _WelcomeStore with Store {
  @observable
  NetworkState logoutState = NetworkState.idle;
  @observable
  NetworkState deleteState = NetworkState.idle;

  Future<String?> logOutUser() async {
    try {
      logoutState = NetworkState.loading;
      final result = await Repository.instance.logout();

      if (result.isNotEmpty) {
        logoutState = NetworkState.success;
        return result;
      }
      throw Exception();
    } catch (e) {
      debugPrint(e.toString());
      logoutState = NetworkState.success;
      return null;
    }
  }

  Future<String?> deleteUser() async {
    try {
      deleteState = NetworkState.loading;
      final result = await Repository.instance.delete();

      if (result.isNotEmpty) {
        deleteState = NetworkState.success;
        return result;
      }
      throw Exception();
    } catch (e) {
      debugPrint(e.toString());
      deleteState = NetworkState.success;
      return null;
    }
  }
}
