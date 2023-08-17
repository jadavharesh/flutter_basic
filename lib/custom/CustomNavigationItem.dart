


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class CustomNavigationItem extends StatefulWidget {
  CustomNavigationItem({Key? key, required this.onClick, required this.text,required this.icons});
  final Function onClick;
  final String text;
  final IconData icons;

  @override
  State<CustomNavigationItem> createState() => _CustomNavigationItemState();
}

class _CustomNavigationItemState extends State<CustomNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child:Column(
          children: [
            Divider(height: 1.h,color: Utils.getColor(ColorCode.grey).withOpacity(0.1)),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 20.w,),
                Icon(widget.icons,size: 23.h,color: Utils.getColor(ColorCode.blue)),
                SizedBox(width: 20.w,),
                Expanded(child: Text(widget.text,style:TextStyle(color:Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontSize: 14.sp,fontFamily: 'Gilroy_semi_bold'))),
              ],
            ),
            SizedBox(height: 10.h)
          ],
        ),
        onTap: ()
        {
          widget.onClick();
        },
      ),
    );
  }
}