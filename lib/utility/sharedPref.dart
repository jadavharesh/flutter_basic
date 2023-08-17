

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class sharedPref
{

  static String drawer_open_close = "drawer_open_close";
  static String token = "token";
  static String user_type = "user_type";
  static String fcm_token = "fcm_token";
  static String device_id = "device_id";
  static String refresh = "refresh";


  static String id = "id";
  static String doctor_id = "doctor_id";
  static String profile = "profile";
  static String name = "name";
  static String gender = "gender";
  static String age = "age";
  static String occupation = "occupation";
  static String licence_number = "licence_number";
  static String clinic_address = "clinic_address";
  static String address = "address";
  static String address_type = "address_type";
  static String area = "area";
  static String city = "city";
  static String state = "state";
  static String pin = "pin";
  static String phone = "phone";
  static String email = "email";
  static String latitude = "latitude";
  static String longitude = "longitude";
  static String open_time = "open_time";
  static String close_time = "close_time";
  static String major_practices = "major_practices";
  static String experience = "experience";
  static String consulting_charge = "consulting_charge";
  static String internal_timing = "internal_timing";
  static String refere_enabled = "refere_enabled";
  static String salary = "salary";
  static String shift_start_time = "shift_start_time";
  static String shift_end_time = "shift_end_time";


  static String getStringPref(String keyName)
  {
    String value="";
    GetStorage getStorage=GetStorage();
    value = getStorage.read(keyName) ?? "";
    return value;
  }

  static int getIntegerPref(String keyName)
  {
    int value;
    GetStorage getStorage=GetStorage();
    value = getStorage.read(keyName) ?? 0;
    return value;
  }

  static saveStringPref(String keyName,String value)
  {
    GetStorage getStorage=GetStorage();
    getStorage.write(keyName,value);
  }

  static saveIntegerPref(String keyName,int value)
  {
    GetStorage getStorage=GetStorage();
    getStorage.write(keyName,value);
  }

  static double getDoublePref(String keyName)
  {
    double value;
    GetStorage getStorage=GetStorage();
    value = getStorage.read(keyName) ?? 0.0;
    return value;
  }

  static saveDoublePref(String keyName,double value)
  {
    GetStorage getStorage=GetStorage();
    getStorage.write(keyName,value);
  }

  static bool getBoolPref(String keyName)
  {
    bool value;
    GetStorage getStorage=GetStorage();
    value = getStorage.read(keyName) ?? false;
    return value;
  }

  static saveBoolPref(String keyName,bool value)
  {
    GetStorage getStorage=GetStorage();
    getStorage.write(keyName,value);
  }

  static bool containKey(String keyName)
  {
    bool value;
    GetStorage getStorage=GetStorage();
    getStorage.read(keyName) == null ? value = false : value = true;
    return value;
  }

  static removeAll()
  {
    //Remove all shared pref
    GetStorage getStorage=GetStorage();
    getStorage.erase();
  }

  static removeSingleValue(String keyName)
  {
    //Remove single shared pref value
    GetStorage getStorage=GetStorage();
    getStorage.remove(keyName);

  }
}