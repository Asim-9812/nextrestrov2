import 'dart:async';
import 'package:flutter/material.dart';
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
    debugPrint('SessionManager: Updating session for ${user.username}. Token present: ${user.token != null}');
    _currentUser = user;
    _token = user.token;
  }

  Future<void> logout() async {
    _currentUser = null;
    _token = null;
    final box = await Hive.openBox(_userBoxName);
    await box.delete(_userKey);
  }

  bool _isExpiring = false;

  void triggerSessionExpired() {
    if (_isExpiring) return;
    _isExpiring = true;
    
    _sessionExpiredController.add(true);
    logout().then((_) {
      // Reset after a delay to allow re-login
      Future.delayed(const Duration(seconds: 5), () => _isExpiring = false);
    });
  }

  void dispose() {
    _sessionExpiredController.close();
  }
}
