import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_myapp/db/repository/user_repository.dart';

import './bloc.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final UserRepository userRepository;

  RegistrationBloc({this.userRepository}) : assert(userRepository != null);

  @override
  RegistrationState get initialState => EmptyState();

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is SignUpWithCredentials) {
      yield* _mapSignUpWithCredentialsEventState(email: event.email,password: event.password);
    }
  }

  Stream<RegistrationState> _mapSignUpWithCredentialsEventState(
      {String email, String password}) async* {
    yield RegistrationLoadingState();
    try {
      await userRepository.signUp(email: email, password: password);
      yield SuccessState();
    } catch (_) {
      yield FailureState();
    }
  }
}
