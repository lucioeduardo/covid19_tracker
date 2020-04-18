import 'package:mobx/mobx.dart';

abstract class IChartController{
  ObservableFuture<List<int>> get graphData;
  void fetchGraphData();
}