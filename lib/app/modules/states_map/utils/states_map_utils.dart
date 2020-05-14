import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';


double getFourthQuartileAverage(List<IMarkerModelData> states) {
    
    if(states==null || states.length<4){
      
      return 1;
    }

    int totalCases = 0;
    int quartileValue = states.length~/4;
    states.sort((a,b){
      
      return a.confirmed>=b.confirmed ? 0 : 1;
    });
    
    for (var state in states.getRange(0, quartileValue)) {
      totalCases+= state.confirmed; 
    }
    return totalCases/quartileValue;
  }
int getMaxCases(List<IMarkerModelData> states) {
    int maxCases = 0;
    for (var state in states) {
      if (state.confirmed > maxCases) {
        maxCases = state.confirmed;
      }
    }
    return maxCases;
}

