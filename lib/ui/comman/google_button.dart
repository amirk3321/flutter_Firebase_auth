

import 'package:flutter/material.dart';


class GoogleButton extends StatelessWidget {
  final VoidCallback _onPressed;
  GoogleButton({Key key,@required VoidCallback onPressed})
      :_onPressed=onPressed,
        super(key :key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: _onPressed, child: Text('Registration'));
  }
}