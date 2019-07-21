import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_myapp/ui/registration_from/registor_screen.dart';
import '../../db/repository/user_repository.dart';
import '../../db/bloc/login/bloc.dart';
import '../../db/bloc/authentication/bloc.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;


  LoginForm({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  UserRepository get _userRepository => widget.userRepository;
  LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _loginBloc,
      listener: (BuildContext context, LoginState state) {
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
        if (state is SuccessState) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Wait account is in progress..!"),
                  CircularProgressIndicator(),
                ],
              ),
              backgroundColor: Colors.green,
            ));

          BlocProvider.of<AuthenticationBloc>(context).dispatch(
            LoggedInEvent(),
          );
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
            LoginButton(onPressed: () {
              onSubmitted();
            }),
            CreateAnAccount(userRepository: _userRepository,),
          ],
        )
      ],
    );
  }

  void onSubmitted() {
    _loginBloc.dispatch(
      SignInWithCredentials(
        email: _emailController.text,
        password: _passwordController.text,
      ),
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
}

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, @required VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: _onPressed, child: Text('Login'));
  }
}


class CreateAnAccount extends StatelessWidget {
 final UserRepository _userRepository;
  CreateAnAccount({Key key,@required  UserRepository userRepository})
 :assert(userRepository!=null),
  _userRepository=userRepository,
 super(key :key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegistorScreen(userRepository: _userRepository,);
          }),
        );
      },
    );
  }
}