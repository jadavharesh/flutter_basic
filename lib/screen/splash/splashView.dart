

import 'package:basic_demo/screen/splash/splashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../custom/CustomText.dart';
import '../../utility/ColorCode.dart';
import '../../utility/Utils.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller){
      return Scaffold(
        backgroundColor: Utils.getColor(ColorCode.blue),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Utils.getColor(ColorCode.blue),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.h,),
                SizedBox(width: 120.w,height: 100.h,
                  child: Image.asset('assets/logo/app_logo.png',fit: BoxFit.fill,color: Utils.getColor(ColorCode.white),),),
                SizedBox(height: 120.h,),
                CustomText(text: 'lbl_app_name'.tr, colorCode: ColorCode.white, fontSize: 17,fontFamily: 'Gilroy_semi_bold'),

              ]
          ),
        ),
      );
    });

  }
}
