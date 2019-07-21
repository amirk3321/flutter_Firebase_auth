import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
@immutable
abstract class AuthenticationState extends Equatable{
  AuthenticationState([List props = const []]) : super(props);
}


// waiting to see if the user is authenticated or not on app start.
class UnInitializedState extends AuthenticationState {
  @override
  String toString() => "UnInitializedState";
}

//notify the bloc user is authenticated
class AuthenticatedState extends AuthenticationState{
  final String email;
  AuthenticatedState({this.email}) : super([email]);
  @override
  String toString() => "AuthenticatedState";
}

//notify the bloc user is not authenticated
class UnAuthenticatedState extends AuthenticationState{
  @override
  String toString() => "UnAuthenticatedState";
}

class LoadingAuthenticationState extends AuthenticationState{
  @override
  String toString() => "LoadingAuthenticationState";
}