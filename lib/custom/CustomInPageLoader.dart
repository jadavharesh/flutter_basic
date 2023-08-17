import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lottie/lottie.dart';
import '../utility/ColorCode.dart';
import '../utility/Utils.dart';


class CustomInPageLoader extends StatefulWidget {
  const CustomInPageLoader({Key? key,}) : super(key: key);


  @override
  State<CustomInPageLoader> createState() => _CustomInPageLoaderState();
}

class _CustomInPageLoaderState extends State<CustomInPageLoader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.h,
              width: 200.w,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                child: Lottie.asset("assets/animation/wait2.json",
                  width: 200.w,
                  height: 200.h,),),
            ),
            SizedBox(height: 10.h,),
            Text('lbl_loading'.tr,textAlign: TextAlign.center,style: TextStyle(color:Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontSize: 17.sp,fontFamily: 'Gilroy_semi_bold')),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
    );
  }
}
