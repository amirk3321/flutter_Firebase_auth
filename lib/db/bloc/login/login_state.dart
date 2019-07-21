import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

class EmptyState extends LoginState {}


class SubmittedState extends LoginState{
  final String email;
  final String password;
  SubmittedState({this.email,this.password}) :super([email,password]);

  @override
  String toString() =>"SubmittedState";
}

class SuccessState extends LoginState{
  @override
  String toString() =>"SuccessState";
}

class FailureState extends LoginState{
  @override
  String toString() =>"FailureState";
}

class LoadingState extends LoginState{
  @override
  String toString() =>"LoadingState";
}
