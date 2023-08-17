import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lottie/lottie.dart';
import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class NoDataFound extends StatefulWidget {
  const NoDataFound({Key? key}) : super(key: key);

  @override
  State<NoDataFound> createState() => _NoDataFoundState();
}

class _NoDataFoundState extends State<NoDataFound> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 3.h,),
          SizedBox(
            height: 200.h,
            width: 200.w,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              child: Lottie.asset("assets/animation/no_data.json",
                width: 70.w,
                height: 70.h,),),
          ),
          SizedBox(height: 10.h,),
          Text('lbl_no_data_found'.tr,textAlign: TextAlign.center,style: TextStyle(color:Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontSize: 17.sp,fontFamily: 'Gilroy_semi_bold')),
          SizedBox(height: 10.h,),
        ],
      ),
    );
  }
}
