import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';
import 'CustomIconButton.dart';

class CustomHeaderWithBack extends StatefulWidget {
  const CustomHeaderWithBack({Key? key, required this.child, required this.title});
  final Widget child;
  final String title;

  @override
  State<CustomHeaderWithBack> createState() => _CustomHeaderWithBackState();
}

class _CustomHeaderWithBackState extends State<CustomHeaderWithBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Utils.getColor(ColorCode.grey_white),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 150.h,
                width: MediaQuery.of(context).size.width,
                color: Utils.getColor(ColorCode.blue),
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset("assets/image/ic_round_yellow.png",width: 110.w,height: 300.h,fit: BoxFit.fill,))
              )
            ],
          ),

          Padding(
              padding: EdgeInsets.only(top: 20.h,left: 15.w,right: 15.w,bottom: 15),
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomIconButton(
                          onClick: (){
                            Get.back();
                          },
                          icons: Icons.arrow_back_ios_sharp,
                          size: 20,
                          color: ColorCode.white),
                      SizedBox(width:20.w),
                      Text(widget.title,style: TextStyle(color: Utils.getColor(ColorCode.white),decoration: TextDecoration.none,fontSize: 20.sp,fontFamily: 'Gilroy_bold'),),
                    ],
                  ),
                  SizedBox(height:20.h),
                  Expanded(
                    child: widget.child,
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
