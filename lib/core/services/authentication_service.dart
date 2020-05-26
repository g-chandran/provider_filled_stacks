import 'dart:async';

import '../../locator.dart';
import '../models/user.dart';
import 'api.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchUserId = await _api.getUserProfile(userId);
    var hasUser = fetchUserId != null;

    if (hasUser) {
      userController.add(fetchUserId);
    }

    return hasUser;
  }
}
