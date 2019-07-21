import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{
  AuthenticationEvent([List props = const []]) : super(props);
}


class AppStartedEvent extends AuthenticationEvent{

  @override
  String toString() => "AppStartedEvent";
}

class LoggedInEvent extends AuthenticationEvent{
  @override
  String toString() => "AppStartedEvent";
}


class LoggedOutEvent extends AuthenticationEvent{
  @override
  String toString() => "LoggedOutEvent";
}
