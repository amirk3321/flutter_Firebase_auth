import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_myapp/db/repository/user_repository.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({this.userRepository}) : assert(userRepository != null);

  @override
  LoginState get initialState => EmptyState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SignInWithCredentials) {
      yield* _mapSignInWithCredentialsState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapSignInWithCredentialsState(
      {String email, String password}) async* {
    yield LoadingState();
    try {
      await userRepository.signIn(
        email: email,
        password: password,
      );
      yield SuccessState();
    } catch (_) {
      yield FailureState();
    }
  }
}
