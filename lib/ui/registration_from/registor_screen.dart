import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_myapp/db/bloc/registration/bloc.dart';
import 'package:flutter_firebase_myapp/db/repository/user_repository.dart';
import 'package:flutter_firebase_myapp/ui/registration_from/registor_form.dart';

class RegistorScreen extends StatefulWidget{
  final UserRepository userRepository;


  RegistorScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  @override
  State<StatefulWidget> createState() => RegistorScreenState();
}

class RegistorScreenState extends State<RegistorScreen>{

  UserRepository get _userRepository=>widget.userRepository;

  RegistrationBloc _registrationBloc;

  @override
  void initState() {
    _registrationBloc=RegistrationBloc(userRepository: _userRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration from"),),
      body: BlocProvider<RegistrationBloc>(builder: (BuildContext context) =>_registrationBloc,
        child: RegistorFrom(),

      ),
    );
  }
}