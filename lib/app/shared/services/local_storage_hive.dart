import 'dart:async';
import 'dart:io';

import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/models/country_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'local_storage_interface.dart';


class LocalStorageHive implements ILocalStorage{
  final String _themeKey = 'THEME';
  final String _countryKey = 'COUNTRY';
  final String _localeKey = 'LOCALE';
  final String _autoCompleteSearchKey = 'AUTOCOMPLETESEARCHKEY';
  
  Completer<Box> _instance = Completer<Box>();
  
  _init() async{
    Directory dir = await getApplicationSupportDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(CountryModelAdapter());
    

    var box = await Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStorageHive(){
    _init();
  }

  @override
  Future<void> setTheme(String value) async {
    var box = await _instance.future;

    await box.put(_themeKey, value);
  }

  @override
  Future<CountryModel> getCountry() async{
    var box = await _instance.future;

    CountryModel value = await box.get(_countryKey);

    return value;
  }

  @override
  Future<String> getTheme() async{
    var box = await _instance.future;

    var value = await box.get(_themeKey);
    value ??= Configuration.defaultThemeKey;
  
    return value.toString();
  }

  @override
  Future<void> setCountry(CountryModel value) async {
    var box = await _instance.future;

    await box.put(_countryKey, value);
  }

  @override
  Future<String> getLocale() async{
    var box = await _instance.future;

    var value = await box.get(_localeKey);
        
    return value;
  }

  @override
  Future<void> setLocale(String value) async {
    var box = await _instance.future;

    await box.put(_localeKey, value);
  }

  @override
  Future<List<String>> getLatestSearchs() async{
    var box = await _instance.future;

    var value = await box.get(_autoCompleteSearchKey);
        
    return value??[];
  }

  @override
  Future<void> setLatestSearchs(List<String> latestSearchs) async {
    var box = await _instance.future;

    await box.put(_autoCompleteSearchKey, latestSearchs??[]);
  }
  
}