import 'package:mobx/mobx.dart';

abstract class IChartController{
  ObservableFuture<Map<String, List<int>>> get graphData;
  void fetchGraphData();
}