import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_myapp/db/bloc/registration/bloc.dart';
import '../../db/bloc/authentication/bloc.dart';

class RegistorFrom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegistorFromState();
}

class RegistorFromState extends State<RegistorFrom> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  RegistrationBloc _registorFromState;

  @override
  void initState() {
    _registorFromState = BlocProvider.of<RegistrationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener(
      bloc: _registorFromState,
      listener: (BuildContext context, RegistrationState state) {
        if (state is FailureState) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text("Error Occurre..!"), Icon(Icons.error)],
              ),
              backgroundColor: Colors.red,
            ));
        }
        if (state is SuccessState){
          BlocProvider.of<AuthenticationBloc>(context).dispatch(
              LoggedInEvent());
          Navigator.pop(context);
        }
      },
      child: buildFormListView(),
    );
  }

  ListView buildFormListView() {
    return ListView(
      children: <Widget>[
        buildTextField(
          hint: "email",
          icon: Icons.person,
          controller: _emailController,
          obscureText: false,
        ),
        buildTextField(
            hint: "password",
            icon: Icons.lock,
            controller: _passwordController,
            obscureText: true),
        ButtonBar(
          children: <Widget>[
            RegisterButton(onPressed: _onSubmit,)
          ],
        )
      ],
    );
  }

  Container buildTextField({hint, icon, controller, obscureText}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[300],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        autocorrect: false,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
            hintText: hint, border: InputBorder.none, suffixIcon: Icon(icon)),
      ),
    );
  }

  void _onSubmit() {
    _registorFromState.dispatch(SignUpWithCredentials(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }
}


class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: _onPressed,
      child: Text('Register'),
    );
  }
}