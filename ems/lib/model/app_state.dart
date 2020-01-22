import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final Map<String, dynamic> studentAttendaceCache;
  AppState(this.studentAttendaceCache);

  factory AppState.empty() => AppState(new Map<String, dynamic>());

  @override
  List<Object> get props => [studentAttendaceCache];

  Map<String, dynamic> toJson() => {'cartItems': studentAttendaceCache};
}
