import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class SignInWithCredentials extends LoginEvent{
  final String email;
  final String password;
  SignInWithCredentials({this.email,this.password}) :super([email,password]);
  @override
  String toString() => "SignInWithCredentials";
}
