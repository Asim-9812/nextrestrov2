import 'package:hive/hive.dart';

class AdminModeService {
  static const String _boxName = 'admin_preferences';
  static const String _modeKey = 'preferred_mode';

  static Future<void> setPreferredMode(String mode) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_modeKey, mode);
  }

  static Future<String> getPreferredMode() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_modeKey, defaultValue: 'admin');
  }

  static Future<void> clearPreferredMode() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(_modeKey);
  }
}
