import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/models/state_model.dart';

abstract class ICovidRepository {
  Future<InfoModel> worldInfo();
  Future<InfoModel> brazilInfo();
  Future<List<StateModel>> getStatesInfo();
}
