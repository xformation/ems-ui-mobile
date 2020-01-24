import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

import 'package:ems/business/middleware/logging_middleware.dart';
import 'package:ems/business/reducers/reducers.dart';
import 'package:ems/business/middleware/api_middleware.dart';
import 'package:ems/model/app_state.dart';
import 'package:ems/business/data/api_client.dart';

Store<AppState> createReduxStore() {
  final apiClient = ApiClient();

  return DevToolsStore<AppState>(
    appStateReducers,
    initialState: AppState(),
    middleware: [
      ApiMiddleware(apiClient),
      LoggingMiddleware()
    ]
  );
}