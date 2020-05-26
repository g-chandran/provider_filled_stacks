import 'package:flutter/material.dart';
import 'package:provider_filled_stacks/ui/views/base_view.dart';

import '../../core/enums/viewstate.dart';
import '../../core/viewmodels/login_model.dart';
import '../shared/app_colors.dart';
import '../widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginHeader(
                controller: _controller,
                validationMessage: model.errorMessage,
              ),
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      color: Colors.white,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        var success = await model.login(_controller.text);
                        if (success) {
                          Navigator.pushNamed(context, '/');
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
