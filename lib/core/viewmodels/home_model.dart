import '../../locator.dart';
import '../enums/viewstate.dart';
import '../models/post.dart';
import '../services/api.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPOsts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
