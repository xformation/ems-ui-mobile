import 'package:ems/model/app_state.dart';
import 'package:ems/business/actions/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is StudentAttendanceCacheLoadedAction) {
    return AppState(action.data);
  }
  return state;
}
