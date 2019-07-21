import 'dart:async';
import 'package:bloc/bloc.dart';
import '../authentication/bloc.dart';
import '../../repository/user_repository.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
  : assert(userRepository !=null);


  @override
  AuthenticationState get initialState => UnInitializedState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStartedEvent){
      yield* _mapAppStartedEventState();
    }else if (event is LoggedInEvent){
      yield* _mapLoggedInEventState();
    }else if (event is LoggedOutEvent){
      yield*  _mapLoggedOutEventState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedEventState() async*{
    try{
      bool isSignIn=await userRepository.isSignIn();
      if (isSignIn){
        yield AuthenticatedState();
      }else{
        yield UnAuthenticatedState();
      }
    }catch(_){
      yield UnAuthenticatedState();
    }
  }

  Stream<AuthenticationState> _mapLoggedInEventState() async*{
    yield AuthenticatedState(email: await userRepository.getCurrentUser());

  }

  Stream<AuthenticationState> _mapLoggedOutEventState() async*{
    yield UnAuthenticatedState();
    await userRepository.signOut();

  }

}
