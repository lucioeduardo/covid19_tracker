import 'package:corona_data/app/modules/charts/charts_module.dart';
import 'package:corona_data/app/modules/charts/stores/chart_settings_store.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initModule(HomeModule());
  
  Widget widget;
  initModule(ChartsModule(widget));
  
  ChartSettingsStore chartStore;
  
  setUp(() {
    chartStore = ChartsModule.to.get<ChartSettingsStore>();
  });

  group('ChartSettingsStore Test', () {
      test("Is instance of ChartSettingsStore", () {
        expect(chartStore, isInstanceOf<ChartSettingsStore>());
      });

      test("All values should start as true", () {
        expect(chartStore.getOption('Case'), true);
        expect(chartStore.getOption('Death'), true);
        expect(chartStore.getOption('Recovered'), true);
      });

      test("Set cases value", () {
        expect(chartStore.getOption('Case'), true);
        chartStore.setOption('Case');
        expect(chartStore.getOption('Case'), false);
      });

      test("Set deaths value", () {
        expect(chartStore.getOption('Death'), true);
        chartStore.setOption('Death');
        expect(chartStore.getOption('Death'), false);
      });

      test("Set recovered value", () {
        expect(chartStore.getOption('Recovered'), true);
        chartStore.setOption('Recovered');
        expect(chartStore.getOption('Recovered'), false);
      });
  });
}
