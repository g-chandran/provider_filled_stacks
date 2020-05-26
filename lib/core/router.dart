import 'package:flutter/material.dart';

import '../ui/views/home_view.dart';
import '../ui/views/login_view.dart';
import '../ui/views/post_view.dart';
import 'models/post.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeView());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginView());
      case '/post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (context) => PostView(post: post));
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
