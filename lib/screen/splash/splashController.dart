import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import '../../utility/ColorCode.dart';
import '../../utility/Utils.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    permisionRequest();
    super.onInit();
  }

  Future<void> permisionRequest() async {

    if(Platform.isAndroid)
    {
      if(await Permission.notification.request().isGranted) {
      }
      else if(await Permission.notification.isDenied) {
        notificationPermisionBottomsheet();
      }
      else if(await Permission.notification.isRestricted) {
        Utils.openPermisionDialog('lbl_notification_message'.tr);
      }
      else if(await Permission.notification.isPermanentlyDenied) {
        Utils.openPermisionDialog('lbl_notification_message'.tr);
      }else
      {
        Utils.openPermisionDialog('lbl_notification_message'.tr);
      }
    }else{
    }
  }

  void notificationPermisionBottomsheet()
  {
    Get.bottomSheet(
        StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Wrap(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Utils.getColor(ColorCode.white),
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h,),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 50.w,
                                height: 3.h,
                                decoration: BoxDecoration(
                                  color: Utils.getColor(ColorCode.grey_white),
                                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Align(alignment: Alignment.topCenter,child: Text('lbl_notification'.tr,style: TextStyle(color:Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontSize: 17.sp,fontFamily: 'Gilroy_bold'))),
                            Container(
                                padding: EdgeInsets.only(top: 10.h,bottom: 10.h,left: 15.w,right: 15.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(width: 2.w,),
                                    Expanded(
                                        child:Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(height: 10.h,),
                                                      Text('lbl_notification_message'.tr,textAlign: TextAlign.center,style: TextStyle(color:Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontSize: 16.sp,fontFamily: 'Gilroy_semi_bold')),
                                                      SizedBox(height: 20.h,),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                )
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                                        color:Utils.getColor(ColorCode.blue).withOpacity(0.9)
                                    ),
                                    height: 45.h,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        child:Center(child: Text('lbl_allow'.tr,style:TextStyle(color: Utils.getColor(ColorCode.white),decoration: TextDecoration.none,fontSize: 15.sp,fontFamily: 'Gilroy_semi_bold'))),
                                        onTap: ()
                                        {
                                          Get.back();
                                          permisionRequest();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              );
            }
        ),
        isDismissible: false,
        barrierColor: Colors.transparent.withOpacity(0.2),
        isScrollControlled: true,
        ignoreSafeArea: false,
        enableDrag: true
    );
  }

}