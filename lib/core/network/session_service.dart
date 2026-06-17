import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_constants.dart';
import 'package:nextrestro/features/login/data/models/login_response.dart';

final sessionServiceProvider = Provider<SessionService>((ref) {
  return SessionService();
});

class SessionService {
  Box? _box;

  Future<void> init() async {
    _box = await Hive.openBox(AppConstants.sessionBox);
  }

  Future<void> saveSession(LoginResponse response) async {
    await _box?.put(AppConstants.tokenKey, response.token);
    await _box?.put(AppConstants.refreshTokenKey, response.refreshToken);
    await _box?.put(AppConstants.userKey, response.toJson());
    await _box?.put(AppConstants.lastLoginTimeKey, DateTime.now().millisecondsSinceEpoch);
  }

  String? getToken() => _box?.get(AppConstants.tokenKey);
  String? getRefreshToken() => _box?.get(AppConstants.refreshTokenKey);
  
  Map<String, dynamic>? getUser() {
    final userData = _box?.get(AppConstants.userKey);
    if (userData != null) {
      return Map<String, dynamic>.from(userData);
    }
    return null;
  }

  Future<void> clearSession() async {
    await _box?.delete(AppConstants.tokenKey);
    await _box?.delete(AppConstants.refreshTokenKey);
    await _box?.delete(AppConstants.userKey);
    await _box?.delete(AppConstants.lastLoginTimeKey);
  }

  bool hasSession() {
    return getToken() != null;
  }

  // --- Remember Me Logic ---

  Future<void> saveRememberMe(bool value, {String? username, String? password}) async {
    await _box?.put(AppConstants.rememberMeKey, value);
    if (value && username != null && password != null) {
      await _box?.put(AppConstants.savedUsernameKey, username);
      await _box?.put(AppConstants.savedPasswordKey, password);
    } else {
      await _box?.delete(AppConstants.savedUsernameKey);
      await _box?.delete(AppConstants.savedPasswordKey);
    }
  }

  bool isRememberMeEnabled() => _box?.get(AppConstants.rememberMeKey, defaultValue: false) ?? false;
  String? getSavedUsername() => _box?.get(AppConstants.savedUsernameKey);
  String? getSavedPassword() => _box?.get(AppConstants.savedPasswordKey);
}
