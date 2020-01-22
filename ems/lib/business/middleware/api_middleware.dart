import 'package:graphql/client.dart';
import 'package:redux/redux.dart';

import 'package:ems/business/actions/actions.dart';
import 'package:ems/model/app_state.dart';
import 'package:ems/business/data/api_client.dart';

class ApiMiddleware extends MiddlewareClass<AppState> {
  final ApiClient apiClient;

  ApiMiddleware(this.apiClient);

  @override
  Future call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is FetchStudentAttendanceCacheAction) {
      this._fetchStudentAttendanceCache(store, action);
    }
    next(action);
  }

  Future _fetchStudentAttendanceCache(
      Store<AppState> store, FetchStudentAttendanceCacheAction action) async {
    action.callback(true);
    QueryResult queryResult = await apiClient.fetchStudentAttendanceCache();
    if (!queryResult.hasErrors) {
      store.dispatch(StudentAttendanceCacheLoadedAction(queryResult.data));
    }
    action.callback(false);
  }
}
