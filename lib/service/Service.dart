import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:basic_demo/utility/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../utility/Utils.dart';
import 'package:http/http.dart' as http;
import 'Commanresponse.dart';

class Service
{

  Duration duration = const Duration(minutes: 2);

/*============  get without token  ===============*/
  @override
  Future getwithouttoken(String url) async {

    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      Utils.showLog("====== request url ====== \n$url");
      responseJson = returnResponses(response);
    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }


  /*============  get with token  ===============*/

  @override
  Future getwithtoken(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
          Uri.parse(url),
          headers: <String, String>{
            'authtoken':sharedPref.getStringPref(sharedPref.token),
          },
      );

      Utils.showLog("====== request url ====== \n$url");
      responseJson = returnResponses(response);
    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }


  /*============  get with param token  ===============*/

  @override
  Future getwithparam(String url, Map<String, dynamic> map) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url).replace(queryParameters: map),
        headers: <String, String>{
          'authtoken':sharedPref.getStringPref(sharedPref.token),
        },
      );
      Utils.showLog("\n ====== request url ======\n$url\n ===== param =====  \n${jsonEncode(map)}");
      responseJson = returnResponses(response);
    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }



  /*============  put with body token  ===============*/

  @override
  Future putwithbody(String url, Map<dynamic, dynamic> map) async {
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'authtoken':sharedPref.getStringPref(sharedPref.token),
        },
        body: jsonEncode(map),
      );
      Utils.showLog("\n ====== request url ======\n$url\n ===== param =====  \n${jsonEncode(map)}");
      responseJson = returnResponses(response);
    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }

  /*============  Multipart Request  ===============*/

  @override
  Future multiPartRequest(String url, Map<String, String> map, List<http.MultipartFile> multiPartFile) async {
    dynamic responseJson;
    try {

      final request = await http.MultipartRequest('POST',Uri.parse(url));
      Utils.showLog("\n ====== request url ======\n$url\n ===== param =====  \n${jsonEncode(map)}");
      request.headers.addAll(<String, String>{'token' : sharedPref.getStringPref(sharedPref.token)});
      request.fields.addAll(map);
      request.files.addAll(multiPartFile);
      final response = await request.send();

      final response1 = await http.Response.fromStream(response);

      responseJson = returnResponses(response1);
    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }


  /*============  post with token  ===============*/


  @override
  Future postwithtoken(String url, Map<dynamic, dynamic> map) async {
    dynamic responseJson;
    try {
      Utils.showLog("\n ====== request url ======\n$url\n ===== param =====  \n${jsonEncode(map)}");

      final response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
          //'authtoken':sharedPref.getStringPref(sharedPref.token),},
          'authtoken':'eyJhbGciOiJIUzI1NiJ9.eyJwYXNzd29yZCI6IjVQRyZNNmdIWV52JWQ5NTciLCJ1c2VyIjoibW9yYmkifQ.0TZxGT7l3R2v0GGBoo7q_bKmrTwCcju1OzXUyFCdpgM',},
          body: map);


      responseJson = returnResponses(response);

    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }

  /*============  post with token  ===============*/


  @override
  Future postwithtokenBody(String url, Map<String, String> map) async {
    dynamic responseJson;
    try {
      Utils.showLog("\n ====== request url ======\n$url\n ===== param =====  \n${jsonEncode(map)}");

      final response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'authtoken':sharedPref.getStringPref(sharedPref.token),},
          body: jsonEncode(map));


      responseJson = returnResponses(response);

    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }


  /*============  post with query param  ===============*/


  @override
  Future postwithqueryparam(String url, Map<String, dynamic> map) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url).replace(queryParameters: map),
        headers: <String, String>{
          'authtoken':sharedPref.getStringPref(sharedPref.token),
        },
      );
      Utils.showLog("\n ====== request url ======\n$url\n ===== param =====  \n${jsonEncode(map)}");
      responseJson = returnResponses(response);
    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }


  /*============  post without token  ===============*/

  @override
  Future postwithouttoken(String url, Map<String, String> map) async {
    //Utils.showLog("\n ====== request url ====== \n$url\n ===== param ===== \n${jsonEncode(map)}");
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url),body: map);
      Utils.showLog("\n ====== request url ====== \n$url\n ===== param ===== \n${jsonEncode(map)}");

      responseJson = returnResponses(response);
    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }

  /*============  post without token  ===============*/

  @override
  Future postwithbodyouttoken(String url, Map<dynamic, dynamic> map) async {
    //Utils.showLog("\n ====== request url ====== \n$url\n ===== param ===== \n${jsonEncode(map)}");
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url),body: jsonEncode(map));
      Utils.showLog("\n ====== request url ====== \n$url\n ===== param ===== \n${jsonEncode(map)}");

      responseJson = returnResponses(response);
    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }


  /*============  delete with token  ===============*/


  @override
  Future deletewithtoken(String url, Map<dynamic, dynamic> map) async {
    dynamic responseJson;
    try {
      final response = await http.delete(
          Uri.parse(url),
          headers: <String, String>{
            'token': sharedPref.getStringPref(sharedPref.token)},
          body: jsonEncode(map));

      Utils.showLog("\n ====== request url ======\n$url\n ===== param =====  \n${jsonEncode(map)}");
      responseJson = returnResponses(response);

    } on SocketException {
      responseJson=returnSocketException();
    }
    return responseJson;
  }


  /*============  success and failer response manage ===============*/

  @visibleForTesting
  dynamic returnResponses(http.Response response) {
    //Utils.showLog(" \n ====response  ====  \n${response.body} \n    response code : ${response.statusCode}");
    log(" \n ====response  ====  \n${response.body} \n    response code : ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return Success(200,responseJson);
      case 500: return 'msg_please_try_again_later'.tr;
      default:
          try{
            return Commanresponse.fromJson(jsonDecode(response.body)).message.toString();
          }on Exception catch (_)
          {
            return 'msg_please_try_again_later'.tr;
          }
    }
  }


  /*============  internet connection and socket exception handle  ===============*/

  dynamic returnSocketException() async {
      bool internetConnected=await Utils.checkInternet();
      if(internetConnected)
      {
          return 'msg_try_again'.tr;
      }else
      {
        bool? isBottomSheetOpen = Get.isBottomSheetOpen ?? false;
        if(isBottomSheetOpen==false)
        {
          Utils.noInternetBottomsheet();
        }
          return 'msg_no_internet'.tr;
      }
  }
}


class Success
{
  int code;
  var response;
  Success(this.code, this.response);
}

class Failure
{
  int code;
  String message;
  Failure(this.code, this.message);
}

