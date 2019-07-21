import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegistrationState extends Equatable {
  RegistrationState([List props = const []]) : super(props);
}

class EmptyState extends RegistrationState {
  @override
  String toString() =>"EmptyStateRegistration";
}


class FailureState extends RegistrationState{

  @override
  String toString() =>"FailureState";
}

class SuccessState extends RegistrationState{

  @override
  String toString() =>"SuccessState";
}


class SignUpWithCredentialsState extends RegistrationState{
  final String email;
  final String password;
  SignUpWithCredentialsState({this.email,this.password})
      :super([email,password]);
  @override
  String toString() =>"SignUpWithCredentialsState";
}

class RegistrationLoadingState extends RegistrationState{
  @override
  String toString() =>"RegistrationLoadingState";
}