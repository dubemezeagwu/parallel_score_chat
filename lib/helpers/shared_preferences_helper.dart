import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{

  static String sharedPreferencesUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferencesUserNameKey = "USERNAMEKEY";
  static String sharedPreferencesUserEmailKey = "USEREMAILKEY";

  // Save loggedIn status to shared preferences
  static Future saveUserLoggedInSharedPreferences(bool isUserLoggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(sharedPreferencesUserLoggedInKey, isUserLoggedIn);
  }

  // Save username data to shared preferences
  static Future saveUserNameSharedPreferences(String userName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(sharedPreferencesUserNameKey, userName);
  }

  // Save email data to shared preferences
  static Future saveUserEmailSharedPreferences(String userEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(sharedPreferencesUserEmailKey, userEmail);
  }

  static Future getUserLoggedInSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(sharedPreferencesUserLoggedInKey);
  }

  static Future getUsernameSharedPreferences () async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(sharedPreferencesUserNameKey);
  }

  static Future getUserEmailSharedPreferences () async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(sharedPreferencesUserEmailKey);
  }
}