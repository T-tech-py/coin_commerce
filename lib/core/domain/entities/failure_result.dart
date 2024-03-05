import 'package:equatable/equatable.dart';

class FailureResult extends Equatable {
  final String title;
  final String message;

  const FailureResult({
    required this.title,
    required this.message,
  });



  @override
  List<Object?> get props => [message,];
}

