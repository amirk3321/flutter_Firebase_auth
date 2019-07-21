import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegistrationEvent extends Equatable {
  RegistrationEvent([List props = const []]) : super(props);
}


class SignUpWithCredentials extends RegistrationEvent{
  final String email;
  final String password;
  SignUpWithCredentials({this.email,this.password}) :super([email,password]);

  @override
  String toString() => "SignUpWithCredentials - email : $email , password : $password";
}
