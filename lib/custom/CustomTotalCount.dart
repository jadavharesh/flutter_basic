import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';


class CustomToalCount extends StatefulWidget {
  CustomToalCount({Key? key, required this.onClick, this.color, required this.title, required this.count});
  final Function onClick;
  final String title;
  final String count;
  final String? color;

  @override
  State<CustomToalCount> createState() => _CustomToalCountState();
}

class _CustomToalCountState extends State<CustomToalCount> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child:Container(
            padding: EdgeInsets.only(top: 10.h,bottom: 10.h,left: 15.w,right: 10.w,),
            decoration: BoxDecoration(
              color: Utils.getColor(ColorCode.grey_white),
              gradient: new LinearGradient(
                    stops: [kIsWeb ? 0.02 : 0.05, 0.02],
                    colors: [Utils.getColor(ColorCode.blue), Utils.getColor(ColorCode.grey_white)]
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,style:TextStyle(color:Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontFamily: 'Gilroy_semi_bold',fontSize: 15.sp)),
                SizedBox(height: 7.h),
                Text(widget.count,style:TextStyle(color:Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontFamily: 'Gilroy_semi_bold',fontSize: 13.sp)),
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
