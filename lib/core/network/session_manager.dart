import 'dart:async';
import 'package:hive/hive.dart';
import '../../features/auth/data/models/user_model.dart';

class SessionManager {
  static const String _userBoxName = 'user_box';
  static const String _userKey = 'cached_user';

  final _sessionExpiredController = StreamController<bool>.broadcast();
  Stream<bool> get sessionExpiredStream => _sessionExpiredController.stream;

  UserModel? _currentUser;
  String? _token;

  UserModel? get currentUser => _currentUser;
  String? get token => _token;

  Future<void> initialize() async {
    final box = await Hive.openBox(_userBoxName);
    final userData = box.get(_userKey);
    if (userData != null) {
      _currentUser = UserModel.fromJson(Map<String, dynamic>.from(userData));
      _token = _currentUser?.token;
    }
  }

  void updateSession(UserModel user) {
    _currentUser = user;
    _token = user.token;
  }

  Future<void> logout() async {
    _currentUser = null;
    _token = null;
    final box = await Hive.openBox(_userBoxName);
    await box.delete(_userKey);
  }

  void triggerSessionExpired() {
    _sessionExpiredController.add(true);
    logout();
  }

  void dispose() {
    _sessionExpiredController.close();
  }
}
