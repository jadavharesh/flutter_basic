import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';


class CustomQuickItem extends StatefulWidget {
  CustomQuickItem({Key? key, required this.onClick, required this.text, required this.icon, this.color, this.marginTop});
  final Function onClick;
  final String text;
  final IconData icon;
  final String? color;
  final double? marginTop;

  @override
  State<CustomQuickItem> createState() => _CustomQuickItemState();
}

class _CustomQuickItemState extends State<CustomQuickItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child:Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width > 900 ? 120 : 95.w,
            padding: EdgeInsets.only(top: 10.h,bottom: 10.h,left: 0.w,right: 0.w,),
            margin: EdgeInsets.only(right:MediaQuery.of(context).size.width > 900 ? 10 : 10.w,top: widget.marginTop ?? 0),
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
                Text(widget.text,textAlign: TextAlign.center,style:TextStyle(color:Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontFamily: 'Gilroy_semi_bold',fontSize: 12.sp)),
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
