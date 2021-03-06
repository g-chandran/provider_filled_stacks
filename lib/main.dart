import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/models/user.dart';
import 'core/router.dart';
import 'core/services/authentication_service.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
