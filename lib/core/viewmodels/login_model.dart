import '../../locator.dart';
import '../enums/viewstate.dart';
import '../services/authentication_service.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    try {
      var userId = int.parse(userIdText);

      if (userId == null) {
        errorMessage = 'Value entered is not a number';
        setState(ViewState.Idle);
        return false;
      }
      var success = await _authenticationService.login(userId);

      setState(ViewState.Idle);
      return success;
    } catch (e) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }
  }
}
