import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../db/bloc/authentication/bloc.dart';

class HomeScreen extends StatefulWidget{
  final String email;
  HomeScreen({Key key,@required this.email})
  :super(key : key);
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
          BlocProvider.of<AuthenticationBloc>(context)
              .dispatch(LoggedOutEvent());
        })
      ],
      ),
      body: Center(child: Text("${widget.email}"),),
    );
  }
}