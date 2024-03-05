import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static const String displayAppearance = "displayAppearance";


  static SharedPreferences? preferences;

   createSharedPref() {
    SharedPreferences.getInstance().then((pref) {
      StorageUtil.preferences = pref;
    });
  }

   setData(String key, dynamic value) {
    if (StorageUtil.preferences != null) {
      if (value is String) {
        StorageUtil.preferences!.setString(key, value);
      } else if (value is int) {
        StorageUtil.preferences!.setInt(key, value);
      } else if (value is double) {
        StorageUtil.preferences!.setDouble(key, value);
      } else if (value is bool) {
        StorageUtil.preferences!.setBool(key, value);
      } else {
        StorageUtil.preferences!.setString(key, value);
      }
    }
  }

   Future<dynamic> getData(String key) async {
    if (StorageUtil.preferences == null) {
      return null;
    } else {
      return StorageUtil.preferences!.get(key);
    }
  }

  Future<dynamic> remove(String key) async {
    if (StorageUtil.preferences == null) {
      return null;
    } else {
      return StorageUtil.preferences!.remove(key);
    }
  }

   void clearData() {
    if(StorageUtil.preferences == null) {
      SharedPreferences.getInstance().then((value) {
        value.clear();
      });
    }else{
      StorageUtil.preferences!.clear();
    }
  }
}
