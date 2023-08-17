
import 'dart:core';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'Service.dart';
import 'package:http/http.dart' as http;

class Repository
{

  final services = Service();

  //base url
  static String baseurl="base url";



  /*============  Login api  ===============*/

  Future<dynamic> login(String username,String password) async
  {
    var map = <String, String>{};
    map['username'] = username;
    map['password'] = password;
    map['device_type'] = kIsWeb ? "web" : Platform.isAndroid ? "android" : "ios";

    return services.postwithtoken(baseurl,map);
  }


  /*============  doctor registration  ===============*/

  Future<dynamic> doctorRegistration(String name,String phone,String email,String password,String licence_number,String gender,String clinic_address,String area,String city,String state,String pin,String major_practices,String experience,String refere,String consulting_charge,String address_type,XFile? profile) async
  {
    var map = <String, String>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    map['licence_number'] = licence_number;
    map['gender'] = gender;
    map['clinic_address'] = clinic_address;
    map['area'] = area;
    map['city'] = city;
    map['state'] = state;
    map['pin'] = pin;
    map['major_practices'] = major_practices;
    map['experience'] = experience;
    map['consulting_charge'] = consulting_charge;
    map['address_type'] = address_type;
    map['refere_enabled'] = refere;

    List<http.MultipartFile> multiPart = [];

    if(profile!=null)
    {
      if(kIsWeb)
      {
        Uint8List data = await profile.readAsBytes();
        List<int> list = data.cast();

        http.MultipartFile multipartFile = await http.MultipartFile.fromBytes('profile',list,filename: profile.name);
        multiPart.add(multipartFile);
      }else
      {
        http.MultipartFile multipartFile = await http.MultipartFile.fromPath('profile',profile.path);
        multiPart.add(multipartFile);
      }
    }

    return services.multiPartRequest(baseurl,map,multiPart);
  }

}