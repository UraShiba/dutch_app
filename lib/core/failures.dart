import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  String toString() {
    return message;
  }

  @override
  List<Object> get props => [message];
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure() : super('Local Storage error');
}
