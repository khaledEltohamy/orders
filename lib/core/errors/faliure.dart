import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// SERVER
class FailureService extends Failure {
  @override
  List<Object?> get props => [];
}

class FailureServiceWithResponse extends Failure {
  final String msg;

  FailureServiceWithResponse({required this.msg});
  @override
  List<Object?> get props => [msg];
}


