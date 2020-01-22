import 'package:equatable/equatable.dart';

class FetchStudentAttendanceCacheAction extends Equatable {
  final dynamic callback;
  FetchStudentAttendanceCacheAction(this.callback);

  @override
  List<Object> get props => [callback];
}

class StudentAttendanceCacheLoadedAction extends Equatable {
  final Map<String, dynamic> data;

  StudentAttendanceCacheLoadedAction(this.data);

  @override
  List<Object> get props => [data];
}
