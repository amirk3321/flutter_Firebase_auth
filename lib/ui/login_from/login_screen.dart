


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_myapp/ui/login_from/login_form.dart';
import '../../db/bloc/login/bloc.dart';
import '../../db/repository/user_repository.dart';

class LoginScreen extends StatefulWidget{

  final UserRepository userRepository;
  LoginScreen({Key key,this.userRepository})
  :assert(userRepository!=null),
  super(key :key);

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}
class LoginScreenState extends State<LoginScreen>{

  UserRepository get _userRepository=>widget.userRepository;

  LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc=LoginBloc(userRepository: _userRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login Form"),),
      body: BlocProvider<LoginBloc>(builder: (BuildContext context) =>_loginBloc,
          child: LoginForm(userRepository: _userRepository,),
    ),
    );
  }
}