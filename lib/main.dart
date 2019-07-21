import 'package:flutter/material.dart';
import 'package:flutter_firebase_myapp/ui/login_from/login_form.dart';
import 'package:bloc/bloc.dart';
import './db/bloc/authentication/bloc.dart';
import './db/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/comman/splash_screen.dart';
import 'ui/home_screen.dart';
import 'ui/login_from/login_screen.dart';

class SimpleDelegate extends BlocDelegate{

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    print(error.toString());
    super.onError(bloc, error, stacktrace);
  }
}

void main() {
  BlocSupervisor.delegate=SimpleDelegate();
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => myAppState();
}

class myAppState extends State<myApp> {
  UserRepository _userRepository=UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _authenticationBloc=AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(
      AppStartedEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return BlocProvider(builder: (BuildContext context) => _authenticationBloc,
     child: MaterialApp(
       home: BlocBuilder(bloc: _authenticationBloc,
         builder: (BuildContext context, AuthenticationState state) {
           if (state is UnInitializedState){
             return SplashScreen();
           }
           if (state is AuthenticatedState){
             return HomeScreen(email: state.email,);
           }

           if (state is UnAuthenticatedState){
             return LoginScreen(userRepository: _userRepository,);
           }

           return Container();
         }, ),
     )

   );

  }
}
