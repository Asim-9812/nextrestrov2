import 'package:hive/hive.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> clearCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _userBoxName = 'user_box';
  static const String _userKey = 'cached_user';

  @override
  Future<void> cacheUser(UserModel user) async {
    final box = await Hive.openBox(_userBoxName);
    await box.put(_userKey, user.toJson());
  }

  @override
  Future<UserModel?> getCachedUser() async {
    final box = await Hive.openBox(_userBoxName);
    final userData = box.get(_userKey);
    if (userData != null) {
      return UserModel.fromJson(Map<String, dynamic>.from(userData));
    }
    return null;
  }

  @override
  Future<void> clearCache() async {
    final box = await Hive.openBox(_userBoxName);
    await box.delete(_userKey);
  }
}
