import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure({required String errorMessage}) : super(errorMessage: errorMessage);
}

class SocketFailure extends Failure {
  const SocketFailure({required String errorMessage}) : super(errorMessage: errorMessage);
}
