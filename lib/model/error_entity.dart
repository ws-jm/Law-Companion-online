import 'package:equatable/equatable.dart';

class ErrorEntity extends Equatable {
  final int? code;
  final String? message;

  const ErrorEntity({required this.code, required this.message});

  @override
  List<Object>get props => [code!, message!];

  @override
  bool get stringify => false;
}
