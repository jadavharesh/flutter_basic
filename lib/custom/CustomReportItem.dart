import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';


class CustomReportItem extends StatefulWidget {
  CustomReportItem({Key? key, required this.onClick, required this.text, required this.icon, this.color});
  final Function onClick;
  final String text;
  final IconData icon;
  final String? color;

  @override
  State<CustomReportItem> createState() => _CustomReportItemState();
}

class _CustomReportItemState extends State<CustomReportItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child:Container(
            height: 90.h,
            width: kIsWeb ? 42.w : 90.w,
            padding: EdgeInsets.only(top: 10.h,bottom: 10.h,left: 10.w,right: 10.w,),
            margin: EdgeInsets.only(left: 5.w,right: 5.w),
            decoration: BoxDecoration(
              color: Utils.getColor(ColorCode.grey_white),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(widget.icon,size: 30,color: Utils.getColor(widget.color ?? ColorCode.blue)),
                SizedBox(height: 5.h),
                Expanded(child: Text(widget.text,textAlign: TextAlign.center,style:TextStyle(color:Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontFamily: 'Gilroy_semi_bold',fontSize: 14.sp))),
              ],
            )),
        onTap: ()
        {
          widget.onClick();
        },
      ),
    );
  }
}
