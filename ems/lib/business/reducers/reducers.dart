import 'package:ems/model/app_state.dart';
import 'package:ems/business/actions/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action.actionType == ActionType.LoadStudentAttendanceCache) {
    state.studentAttendaceCache = action.data;
    return AppState.update(state);
  } else if(action.actionType == ActionType.LoadStudentAttendanceData){
    state.studentAttendanceData = action.data;
    return AppState.update(state);
  }
  return state;
}
