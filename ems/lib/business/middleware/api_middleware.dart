import 'package:graphql/client.dart';
import 'package:redux/redux.dart';

import 'package:ems/business/actions/actions.dart';
import 'package:ems/model/app_state.dart';
import 'package:ems/business/data/api_client.dart';

class ApiMiddleware extends MiddlewareClass<AppState> {
  final ApiClient apiClient;

  ApiMiddleware(this.apiClient);

  @override
  Future call(
      Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action.actionType == ActionType.FetchStudentAttendanceCache) {
      this._fetchStudentAttendanceCache(store, action);
    } else if (action.actionType == ActionType.FetchStudentAttendanceData) {
      this._getStudentAttendanceCache(store, action);
    }
    next(action);
  }

  Future _fetchStudentAttendanceCache(
      Store<AppState> store, GlobalAction action) async {
    action.callback(true);
    QueryResult queryResult = await apiClient.fetchStudentAttendanceCache();
    if (!queryResult.hasErrors) {
      store.dispatch(GlobalAction(
          ActionType.LoadStudentAttendanceCache,
          queryResult.data["createStudentAttendanceCacheForAdmin"]
              as Map<String, dynamic>,
          null));
    }
    action.callback(false);
  }

  Future _getStudentAttendanceCache(
      Store<AppState> store, GlobalAction action) async {
    action.callback(true);
    QueryResult queryResult = await apiClient.getStudentAttendanceCache();
    if (!queryResult.hasErrors) {
      store.dispatch(GlobalAction(
          ActionType.LoadStudentAttendanceData,
          queryResult.data["getStudentAttendanceDataForAdmin"]
              as List<dynamic>,
          null));
    }
    action.callback(false);
  }
}
